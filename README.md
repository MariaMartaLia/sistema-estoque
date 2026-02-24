# Sistema de Controle de Estoque

Sistema completo de controle de estoque com regras de negócio implementadas

---

## Objetivo

Desenvolver um sistema que vá alem de um CRUD simples, garantindo:

- Consistência de dados
- Controle de concorrência
- Regras de negócio do banco
- Arquitetura organizada

---

## Arquitetura

Frontend:
- React

Backend:
- FastAPI
- Python
- Transações explicítas (BEGIN, COMMIT, ROLLBACK)

Banco de Dados:
- PostgreSQL
- Trigger de validação de estoque 
- CHECK constraints
- SELECT FOR UPDATE para controle de concorrência

---

## Regras Implementada

- Bloqueio de saída com estoque insuficiente 
- Validação de quantidade mínima
- Controle de concorrência com SELECT FOR UPDATE
- Atualização transacional para evitar inconcistência 

---

## Decisão Técnica Importante

Foi utilizado SELECT FOR UPDATE para evitar que duas operações simultaneas utilizem o mesmo dado antes da atualização.
Isso garante integridade e evita inconcistência de dados.

---

## Como executar

1. Criar banco PostgreSQL
2. Executar script schema.sql
3. Criar usuário e permissões
4. Ativar venv
5. Executar:
uvicorn src.min:app --reload
6. Rodar frontend:
npm run dev

---

## Status

Versão 1.0 - Documentação técnica completa
