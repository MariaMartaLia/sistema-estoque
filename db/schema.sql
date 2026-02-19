CREATE TABLE produto(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    Quantidade_Atual INTEGER NOT NULL DEFAULT 0 CHECK (Quantidade_Atual >= 0),
    Quantidade_Minima INTEGER NOT NULL DEFAULT 0 CHECK (Quantidade_Minima >= 0),
    Data_Cadastro TIMESTAMP NOT NULL DEFAULT  CURRENT_TIMESTAMP,
    Ativo BOOLEAN NOT NULL DEFAULT TRUE);


CREATE TABLE Movimentacao(
    ID SERIAL PRIMARY KEY,
    Produto_ID INTEGER NOT NULL,
    Tipo_Movimentacao VARCHAR(10) NOT NULL CHECK (Tipo_Movimentacao IN('entrada', 'Sau=ida')),
    Quantidade INTEGER NOT NULL CHECK (Quantidade > 0),
    Data_Movimentacao TIMESTAMP NO NULL DEFAULT CURRENT_TIMESTAMP,
    Observacao TEXT,

    CONSTRAINT fk_produto
        FOREIGN KEY (Produto_ID)
        REFERENCES produto(ID)
        ON DELETE RESTRICT
);

CREATE OR REPLACE FUNCTION Validar_Estoque()
RETURNS TRIGGER AS $$
DECLARE
    Estoque_Atual INTEGER;
BEGIN
    --Buscar qauntidade atual do produto
    SELECT Quantidade_Atual
    INTO Estoque_Atual
    FROM produto
    WHERE ID = NEW.Produto_ID;

    --Se for saída, Validar quantidade 
    IF NEW.Tipo_Movimentacao = 'saida'THEN
        IF NEW.Quantidade > Estoque_Atual THEN  
            RAISE EXCEPTION 'Estoque insuficiente para realizar esta operação!';
            END IF;
        END IF;
        RETURN NEW;
    END;
    $$ LANGUAGE plpgsql;

    CREATE TRIGGER Trigger_Validar_Estoque
    BEFORE INSERT ON Movimentacao
    FOR EACH ROW
    EXECUTE FUNCTION Validar_Estoque();
