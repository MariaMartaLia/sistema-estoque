# Documento de Visão Geral
## Sistema de Controle de Estoque 

---

## 1. Contexto

Atualmente grande maioria dos pequenos restaurantes realizam controle de estoque manualmente e as vezes nem fazem o controle correto para ter um parametro de como anda a saúde financeira do negocio.

## 2. Problema 

A ausência de um sistema automatizado pode causar:

- falta de controle de uso de produtos de auto risco
-Falta de estratégias para corte de custos desnecessarios 
-Falta de rastreabilidade de entradas e saídas de produtos 
-Falta de controle de estoque gerando excesso e ou falta de produtos de auto giro 
-Gasto desnecessario de verbas em produtos de baixo giro 

---

## 3. Objetivo

Desenvolver um sistema simples e eficiente de controle de estoque que permita:

-Cadastro de produto (Entrada)
-Registro de entrada de estoque 
-Registro de saida de estoque 
-Consulta de estoque atual
-Alerta de estoque minimo
-Alerta de produto que não movimenta a alguns dias 
-Visualização do historico de movimentação

---

## 4. Publico-Alvo

-Restaurantes de pequeno porte e ou iniciantes na area.
-Estabelecimentos pequenos com controle manual e ou planilhas ou se controle algum do estoque 
-Jovens de baixa renda que buscam investir em um negocio proprio

## 5. Escopo da versão 1(MVP)

-Cadastro de produto
-Registro de Entrada 
    -Compras 
    -Produção
-Registro de saida 
    -Produção
    -Venda 
Relatorio simples de movimentação 
    -Alerta de Excesso de Produto
    -Alerta de Estoque Minimo

---
## 6. Fora do Escopo 

-Dashboard analítico
-Integração com ERP
-Multi-Filial
-Controle avançado de permissões 

---
## 7. Criterios de Sucesso

-Sistema Funcional 
-Persistencia de Dados em Banco Relacional
-API Documentada 
-Código versionado em repositorio 