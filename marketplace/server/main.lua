-- Desenvolvido por Marcos Boni 
-- Desenvolvido por Marcos Boni
-- Lógica principal do lado do servidor para o sistema de mercado de ações e negócios.
-- Atualiza os preços das ações periodicamente e lida com as transações de compra e venda de ações.
-- Também lida com eventos de mercado e atualiza as receitas e despesas dos negócios.

local DB = require("database")
local Utils = require("utils")
local Businesses = require("businesses")
local Config = require("config")

local function updateStockPrices()
    for companyName, _ in pairs(Config.StockMarket.InitialPrices) do
        local price = Utils.calculateStockPrice(companyName)
        TriggerClientEvent('marketplace:updateStockPrice', -1, companyName, price)
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(Config.StockMarket.UpdateInterval)
        updateStockPrices()
    end
end)

RegisterNetEvent('marketplace:buyStock')
AddEventHandler('marketplace:buyStock', function(playerId, companyName, amount)
    local stockPrice = Utils.calculateStockPrice(companyName)
    local totalCost = stockPrice * amount

    local player = DB.getPlayer(playerId)
    if player.money < totalCost then
        TriggerClientEvent('marketplace:notification', playerId, 'Não há dinheiro suficiente.')
        return
    end

    DB.updatePlayerMoney(playerId, player.money - totalCost)
    DB.addStockToPlayer(playerId, companyName, amount)

    TriggerClientEvent('marketplace:notification', playerId, 'Compra bem-sucedida.')
end)

RegisterNetEvent('marketplace:sellStock')
AddEventHandler('marketplace:sellStock', function(playerId, companyName, amount)
    local stockPrice = Utils.calculateStockPrice(companyName)

    local player = DB.getPlayer(playerId)
    local stockAmount = DB.getPlayerStock(playerId, companyName)
    if stockAmount < amount then
        TriggerClientEvent('marketplace:notification', playerId, 'Não há ações suficientes.')
        return
    end

    local totalEarnings = stockPrice * amount
    DB.updatePlayerMoney(playerId, player.money + totalEarnings)
    DB.removeStockFromPlayer(playerId, companyName, amount)

    TriggerClientEvent('marketplace:notification', playerId, 'Venda bem-sucedida.')
end)

RegisterNetEvent('marketplace:triggerEvent')
AddEventHandler('marketplace:triggerEvent', function(eventType)
    local impact = Config.StockMarket.EventImpact[eventType] or 0
    TriggerClientEvent('marketplace:marketEvent', -1, eventType, impact)
end)
