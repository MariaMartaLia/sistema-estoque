CREATE TABLE produto(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    quantidade_atual INTEGER NOT NULL DEFAULT 0 CHECK (quantidade_atual >= 0),
    quantidade_minima INTEGER NOT NULL DEFAULT 0 CHECK (quantidade_minima >= 0),
    data_cadastro TIMESTAMP NOT NULL DEFAULT  CURRENT_TIMESTAMP,
    ativo BOOLEAN NOT NULL DEFAULT TRUE);


CREATE TABLE movimentacao(
    id SERIAL PRIMARY KEY,
    produto_id INTEGER NOT NULL,
    tipo_movimentacao VARCHAR(10) NOT NULL CHECK (tipo_movimentacao IN('entrada', 'saida')),
    quantidade INTEGER NOT NULL CHECK (quantidade > 0),
    data_movimentacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    observacao TEXT,
     CONSTRAINT fk_produto
        FOREIGN KEY (produto_id)
        REFERENCES produto(id)
        ON DELETE RESTRICT
);
 CREATE OR REPLACE FUNCTION validar_estoque()
RETURNS TRIGGER AS $$
DECLARE
    estoque_atual INTEGER;
BEGIN
    --Buscar quantidade atual do produto
    SELECT quantidade_atual
    INTO estoque_atual
    FROM produto
    WHERE id = NEW.produto_id;

    --Se for saída, Validar quantidade 
    IF NEW.tipo_movimentacao = 'saida' THEN
        IF NEW.quantidade > estoque_atual THEN  
            RAISE EXCEPTION 'Estoque insuficiente para realizar esta operação!';
            END IF;
        END IF;
        RETURN NEW;
    END;
    $$ LANGUAGE plpgsql;

    CREATE TRIGGER trigger_validar_estoque
    BEFORE INSERT ON movimentacao
    FOR EACH ROW
    EXECUTE FUNCTION validar_estoque();
