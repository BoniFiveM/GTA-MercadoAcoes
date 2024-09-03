# Sistema de Mercado de Ações e Negócios para GTA 5 RP

**Desenvolvido por Marcos Boni**

## Descrição

Este projeto adiciona um sistema avançado de mercado de ações e administração de negócios ao servidor de GTA 5 RP. O sistema inclui:

- **Mercado de Ações:** Onde os jogadores podem comprar e vender ações de empresas fictícias.
- **Negócios:** Os jogadores podem adquirir e gerenciar diversos tipos de negócios dentro do jogo.

## Estrutura do Projeto

O projeto é dividido nas seguintes partes principais:

### 1. Configuração

- **Arquivo:** `config/config.lua`
- **Descrição:** Contém configurações globais para o sistema de mercado de ações e negócios, como preços iniciais, volatilidade das ações, impacto de eventos e detalhes financeiros dos negócios.

### 2. Lógica do Servidor

- **Arquivos:** `server/main.lua`, `server/businesses.lua`, `server/database.lua`, `server/utils.lua`
- **Descrição:** Implementa a lógica do lado do servidor para o sistema de mercado de ações e negócios. Inclui a atualização dos preços das ações, gerenciamento de transações de compra e venda de ações, e administração de negócios.

### 3. Interface do Cliente

- **Arquivos:** `client/main.lua`, `client/ui.lua`, `client/events.lua`
- **Descrição:** Gerencia a interação do jogador com o sistema, incluindo a interface para compra e venda de ações e administração de negócios.

### 4. Manifesto do FiveM

- **Arquivo:** `fxmanifest.lua`
- **Descrição:** Define o manifesto do FiveM para o recurso, incluindo as dependências e os scripts do servidor e do cliente.




