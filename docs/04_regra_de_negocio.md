# 04. Regras de Negócio

## 1. Estoque Não Pode Ser Negativo

Se tipo_movimentacao = 'saida'
quantidade <= quantidade_atual

caso contrário:
HTTP 400 - Estoque insuficiente

---

## 2. Atualização Obrigatoria de Estoque

Toda movimentação gera:

- Atualização da tabela produto
- Registro na tabela movimentação

---

## 3. Validação de Produto Existente

Se produto não existir:
HTTP 404