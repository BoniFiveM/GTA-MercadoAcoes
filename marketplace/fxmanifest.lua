-- Desenvolvido por Marcos Boni
-- Manifesto de recursos para o FiveM que define os arquivos e dependências do recurso.

fx_version 'cerulean'
game 'gta5'

author 'Marcos Boni'
description 'Sistema avançado de mercado de ações e negócios para GTA 5 RP'
version '1.0.0'

server_script {
    'server/database.lua',
    'server/utils.lua',
    'server/businesses.lua',
    'server/main.lua'
}

client_script {
    'client/main.lua',
    'client/ui.lua',
    'client/events.lua'
}

shared_script 'config/config.lua'
