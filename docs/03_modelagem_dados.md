# 03 - Modelagem de Banco de Dados 

## 1. Tabela produto

| Campo | Tipo | Restrição |
|-------|------|-----------|
|  id   |SERIAL|    PK     |
| nome  | VARCHAR(100) | NOT NULL |
| quantidade_atual | INTEGER | >= 0 |
| quantidade_minima | INTEGER | >= 0 |
| data de cadastro | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP |

---

## 2. Tabela Movimentação

| Campo | Tipo |
|-------|------|
| id    |SERIAL|
| produto_id | INTEGER (FK) |
| tipo_movimentação | entrada / saída |
| quantidade | INTEGER ( >0) |
| data_movimentação | TIMESTAMP |

---

## 3. Integridade

- FK garante consistência entre produto e movimentação
- CHECK impede valores inválidos
- Estoque nunca pode ficar negativo