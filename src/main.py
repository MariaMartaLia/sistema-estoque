from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import psycopg2

app = FastAPI()

def get_connection():
    return psycopg2.connect(
        dbname="estoque_db",
        user="estoque_user",
        password="13241900",
        host="localhost",
        port="5432"
    )

class Movimentacao(BaseModel):
    produto_id: int
    tipo_movimentacao: str
    quantidade: int


@app.get("/")
def home():
    return {"message":"API do Sistema de Estoque está funcionando!!!"}

@app.get("/produtos")
def listar_produtos():
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM produto;")
    produtos = cursor.fetchall()
    cursor.close()
    conn.close()
    return {"produtos": produtos}

@app.post("/movimentacoes")
def criar_movimentacao(dados: Movimentacao):
    conn = get_connection()
    cursor = conn.cursor()


    try:

        conn.autocommit = False

        cursor.execute(
            "SELECT quantidade_atual FROM produto WHERE id = %s FOR UPDATE;",
            (dados.produto_id,)
        )

        resultado = cursor.fetchone()

        if not resultado:
            raise HTTPException(status_code=404, detail="Produto não encontrado!")

        estoque_atual = resultado[0]

        if dados.tipo_movimentacao == "saida":
            if dados.quantidade > estoque_atual:
                raise HTTPException(status_code=400, detail="Estoque insuficiente")
            novo_estoque = estoque_atual - dados.quantidade

        elif dados.tipo_movimentacao == 'entrada':
            novo_estoque = estoque_atual + dados.quantidade

        else:
            raise HTTPException(status_code=400, detail="Tipo de movimentação invalida!!")
        
        cursor.execute(
            "UPDATE produto SET quantidade_atual =%s WHERE id = %s;",
            (novo_estoque, dados.produto_id)       
         )
        
        cursor.execute(
            """
            INSERT INTO movimentacao(
            produto_id, 
            tipo_movimentacao, 
            quantidade
            )
            VALUES (%s, %s, %s);
            """,
            (dados.produto_id,dados.tipo_movimentacao, dados.quantidade)

        )

        conn.commit()

        return{
            "message": "Movimentação realizada com sucesso!!",
            "estoque_atual": novo_estoque
        }
    
    except Exception as e:
        conn.rollback()
        raise e
    
    finally:
        cursor.close()
        conn.close()

from fastapi.middleware.cors import CORSMiddleware

app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:5173"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)




