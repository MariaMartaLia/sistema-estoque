# - Arquitetura do Sistema

## 1. Modelo Arquitetural

Arquitetura Client-Server em três camadas:

Frontend (React)
↓
Backend (FastAPI)
↓
Banco de Dados (PostgreSQL)

---

## 2. Backend

Responsável por:

- Regras de negócio
- Controle transacional
- Validade de dados
- Controle de concorrência
- Exposição de API REST

---

## 3. Banco de Dados

Modelo Relacional:

- Integridade referencial
- Constraints
- Chaves primárias e estrangeiras 

---

## 4. Frontend

- Interface reativa
- Consumo de API REST
- Atualização dinâmica
