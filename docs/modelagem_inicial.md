# Modelagem Inicial do Sistema 

## Entidade: Produto

- ID (PK)
- Nome
- Descrição
- Quantidade_Atual
- Quantidade _Minima 
- Data_Cadastro
- Ativo

Regra:
Se a Quantidade_Atual <= Quantidade_Minima -> Gerar Alerta 

--- 

## Entidade: Movimentação 

- ID (PK)
- Produto_ID (FK)
- Tipo_Movimentacao (Entrada/Saida)
- Quantidade
- Data_Movimentacao
- Observacao

Regra:
 Se não houver Movimentação nos ultimos 7 dias -> Gerar alerta de produto sem movimentação 