# 06 - Decisões Arquiteturais

## 1. Uso do FastAPI

Escolhido por:

- Alta performance
- Documentação automatica
- Validação automatica via Pydantic

---

## 2. Uso PostgreSQL

Escolhido por:

- Suporte robusto a transações
- Controle de Concorrência
- Confiabilidade

--- 

## 3. Uso de SELECT FOR UPDATE

Motivação:

Evitar race condition e inconcistência de estoque em operações simultâneas.

---

## 4. Separação Frontend / Backend

Permite:

- Escalabilidade 
- Independência de deploy
- Evolução futura para microsserviços