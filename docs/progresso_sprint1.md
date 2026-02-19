# Progresso - Sprint 1
## Sistema de controle de Estoque

---

## 1- Infraestrutura Configurada

- Ambiente Linux (WSL Umbuntu) configurado
- VS Code integrado com WSL
- PostgreSQL instalado e em execução
- Banco de Dados criado: estoque_db

---

## 2- Modelagem de Banco de Dados

### Tabela: produto

Campos:
- id (PK)
- nome
- descrição
- quantidade_atual
- quantidade_minima
- data_cadastro
- ativo

Regras Implementadas:
- Quantidade não pode ser negativa (CHECK constraint)
- Controle de estoque mínimo via campo quantidade_minima 

---

### Tabela : movimentacao

Campo:
- id (PK)
- produto_id (FK)
- tipo_movimentacao (entrada/saída)
- quantidade
- data_movimentacao
- observacao

Regras Implementadas:
- Quamtidade sempre maior que 0
- Integridade referencial com produto
- Não permite exclusão de produto com movimentação (ON DELETE RESTRICT)

---

## 3. Regras de Negocio Implementadas

### Trigger de Validação de Estoque

Função:
- validar_estoque()

Comportamento:
- Antes de inserir movimentação
- Se tipo = 'saida'
- verificar estoque atual
- Bloqueia se quantidade for maior que estoque disponível 

Resultado:
- Impede inconsistencia de dados
- Garante integridade no banco

---

# 4- Testes Realizados

- Inserção de produto
- Tentativa de saída maior que estoque (Bloqueada corretamente)
- Validação da Trigger funcionando

---

## 5- Decisões Arquiteturais

- Atualozação de estoque será feita via transação controlada na aplicação 
- Uso do SELECT FOR UPDATE para controle de concorrecia
- Trigger utilizada apenas para validação de regra crítica
- Banco responsável por integridade estrutural


---

## 6- Status Atual

- Sistema de banco estruturado e validado
- Pronto para implementação de camadas (API)