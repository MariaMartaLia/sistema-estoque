# 07 - Documentação da API

Base URL:
http://localhost:8000

---

## GET/produto

Retorna todos os produtos.

### Response 200

{
    "produtos":[
        [1, "Arroz", 10, 2]
    ]
}

---

## POST/movimentações

Cria uma movimentação.

### Body

{
    "produto_id":1,
    "tipo_movimentação":"entrada",
    "quantidade":5
}

### Possíveis Respostas

200 - Sucesso
400 - Estoque Insuficiente 
404 - Produto não encontrado

---

## Códigos HTTP Utilizados

200 - OK
400 - Bad Request
404 - Not Found
500 - Internal Server Error