# 🏆 Copa do Mundo Feminina
![Badge](https://img.shields.io/badge/SQL%20Server-Project-blue) ![Badge](https://img.shields.io/badge/Version-2025-green) ![Badge](https://img.shields.io/badge/Status-Stable-success)

Simulador da Copa do Mundo de Futebol Feminino da FIFA 2023

Este projeto apresenta uma versão completa e evolutiva do simulador da Copa do Mundo de Futebol Feminino, baseado no mesmo código-fonte utilizado na versão da Copa do Mundo de 2022. A aplicação permite simular todas as fases do torneio, realizar análises estatísticas e acompanhar o desempenho das seleções ao longo das simulações.

---

## 🚀 Instruções de Execução

Para realizar a execução correta do simulador, siga a **ordem de numeração dos arquivos** conforme descrito abaixo.

### 🎯 Escolha do Tipo de Sorteio

Antes de iniciar a simulação, defina como deseja criar os grupos da Copa:

- **Grupos definidos pela FIFA:**  
  Execute o arquivo `1` para criar o ambiente com os grupos oficiais da FIFA.

- **Grupos definidos aleatoriamente:**  
  Execute o arquivo `1.1` para criar o ambiente com grupos sorteados aleatoriamente.

Após a criação do ambiente, siga a sequência de execução dos arquivos conforme o tipo de sorteio escolhido.

---

## 📂 Funcionalidades por Versão

### 📌 Versão 1.0 — Desenvolvimento entre 01/04/22 e 15/04/22

1. Simulação dos 48 jogos da fase de grupos.
2. Definição das 16 seleções classificadas para as Oitavas de Final.
3. Simulação dos 8 jogos das Oitavas de Final.
4. Definição das 8 seleções classificadas para as Quartas de Final.
5. Simulação dos 4 jogos das Quartas de Final.
6. Definição das 4 seleções classificadas para a Semi Final.
7. Simulação dos 2 jogos da Semi Final.
8. Definição das seleções para a Disputa de Terceiro Lugar e Grande Final.
9. Simulação dos 2 jogos finais: Terceiro Lugar e Grande Final.
10. Análise de empates e simulação de prorrogação ou pênaltis a partir das Oitavas.
11. Classificação final com posições de 1º a 4º lugar.
12. Classificação final das 32 seleções por pontuação obtida.  
13. Classificação final das 32 seleções segundo critérios da FIFA.  
14. Histórico de jogos com base nas simulações.  
15. Histórico de classificações obtidas.  
16. Histórico das seleções Campeã e Vice-Campeã.

---

### 📌 Versão 2.0 — Desenvolvimento entre 18/04/22 e 05/05/22

1. Análise de desempenho das finais disputadas.  
2. Estatísticas das 16 primeiras posições.  
3. Análise das finais com base na seleção campeã.  
4. Inclusão de barra de progresso durante a simulação.  
5. Redução do tempo médio de processamento de 0.55s para entre 0.07s e 0.10s.

---

### 📌 Versão 3.0 — Desenvolvimento entre 10/05/22 e 15/06/22

1. Atualização das seleções participantes.  
2. Correção de erros nos placares de pênaltis.  
3. Inclusão dos arquivos 11 e 12.

---

### 📌 Versão 4.0 — Desenvolvimento entre 06/09/22 e 07/09/22

1. Correção nas estatísticas das 16 primeiras posições.  
2. Inclusão do arquivo 8.3.

---

### 📌 Versão 4.1 — Atualização entre 09/11/23 e 10/11/23.

1. Correção no arquivo 3 — Definição das 16 seleções classificadas para as Oitavas.  
   - Corrige falha na exibição das seleções classificadas quando executado passo a passo.

---

### 📌 Versão 4.2 — Atualização entre 09/01/24 e 11/01/24

1. Correções nos arquivos 1.0 e 2.0 — Relacionados à definição das seleções conforme a FIFA.

---

### 📌 Versão 4.3 — Atualização entre 27/09/25 e 02/10/25

1. Inclusão da coluna `ProrrogacaoOuPenaltys` na Tabela **Jogos** para controle de empates nas fases finais.  
2. Validação condicional para simular prorrogação ou pênaltis com registro do vencedor.  
3. Melhorias na apresentação da Campeã e Vice-Campeã.  
4. Correções nas condições de análise das fases de Quartas e Semi Final.  
5. Redução do tempo médio de processamento para entre 0.05s e 0.07s.

### 📌 Versão 4.4 — Atualização entre 20/11/25 e 23/11/25
1. Correção na formas de definição das seleções classificadas para a Fase Oitavas de Final.

---

## 📌 Observações Finais

- Este simulador é ideal para fins didáticos, análises estatísticas e demonstrações de lógica de programação aplicada ao futebol.
- Para melhor aproveitamento, siga rigorosamente a ordem de execução dos arquivos.
- Para dúvidas ou sugestões, entre em contato com o mantenedor do projeto.
