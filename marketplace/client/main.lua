-- Desenvolvido por Marcos Boni
-- Gerencia as interações do jogador com o sistema de mercado de ações.
-- Inclui funções para comprar e vender ações e receber notificações.

RegisterNetEvent('marketplace:notification')
AddEventHandler('marketplace:notification', function(message)
    print(message)
end)

RegisterNetEvent('marketplace:updateStockPrice')
AddEventHandler('marketplace:updateStockPrice', function(companyName, price)
    -- Atualizar a interface do usuário com o novo preço
end)

RegisterNetEvent('marketplace:marketEvent')
AddEventHandler('marketplace:marketEvent', function(eventType, impact)
    -- Atualizar a interface do usuário com eventos de mercado
end)

function buyStock(companyName, amount)
    TriggerServerEvent('marketplace:buyStock', GetPlayerServerId(PlayerId()), companyName, amount)
end

function sellStock(companyName, amount)
    TriggerServerEvent('marketplace:sellStock', GetPlayerServerId(PlayerId()), companyName, amount)
end
