# Sistema de Controle de Estoque

Sistema completo de controle de estoque com implementação de regras de negócio no banco de dados e controle transacional na API.

---

## 🚀 Tecnologias

- PostgreSQL
- FastAPI
- React
- Git

---

## 🏗 Arquitetura

Frontend (React)  
⬇  
Backend (FastAPI)  
⬇  
Banco de Dados (PostgreSQL)

---

## 🔐 Regras Implementadas

- Validação de estoque mínimo
- Bloqueio de saída com estoque insuficiente
- Controle de concorrência com SELECT FOR UPDATE
- Atualização transacional (COMMIT / ROLLBACK)

---

## 🎯 Objetivo do Projeto

Desenvolver um sistema que vá além de um CRUD simples, garantindo consistência, integridade e controle de concorrência.

---

## 📌 Próximas Evoluções

- Dockerização
- Autenticação
- Testes automatizados
- Separação em camadas (Service / Repository)
