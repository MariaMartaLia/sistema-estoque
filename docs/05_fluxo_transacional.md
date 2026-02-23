# 05 - Fluxo Transacional

## 1. Controle de transações 

corn.autocommit = False

Processo:

1. SELECT ... FOR UPDATE
2. Validação de estoque
3. UPDATE produto
4. INSERT movimentação
5. COMMIT

Se der erro:
ROLLBACK

---
 ## 2. Controle de Concorrência

 Utilização de :

 SELECT quantidade_atual
 FROM produto
 WHERE id = ?
 FOR UPDATE;

 Esse comando:

 - Bloqueia a linha
 - Inpede leitura simultânea inconsistente 
 - Garante seralização lógica 