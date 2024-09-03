-- Desenvolvido por Marcos Boni
-- Gerencia a compra e administração de negócios no servidor.
-- Inclui a compra de negócios, administração (expansão, customização), e atualização de receitas e despesas.

local DB = require("database")
local Config = require("config")

RegisterNetEvent('marketplace:buyBusiness')
AddEventHandler('marketplace:buyBusiness', function(playerId, businessName)
    local price = Config.Businesses.InitialPrice

    local player = DB.getPlayer(playerId)
    if player.money < price then
        TriggerClientEvent('marketplace:notification', playerId, 'Não há dinheiro suficiente.')
        return
    end

    DB.updatePlayerMoney(playerId, player.money - price)
    DB.addBusinessToPlayer(playerId, businessName)

    TriggerClientEvent('marketplace:notification', playerId, 'Compra de negócio bem-sucedida.')
end)

RegisterNetEvent('marketplace:manageBusiness')
AddEventHandler('marketplace:manageBusiness', function(playerId, businessName, action)
    local player = DB.getPlayer(playerId)
    local business = DB.getBusiness(businessName)

    if action == 'expand' then
        local cost = business.expansionCost
        if player.money < cost then
            TriggerClientEvent('marketplace:notification', playerId, 'Não há dinheiro suficiente para expansão.')
            return
        end
        DB.updatePlayerMoney(playerId, player.money - cost)
        DB.expandBusiness(businessName)
        TriggerClientEvent('marketplace:notification', playerId, 'Expansão bem-sucedida.')

    elseif action == 'customize' then
        -- Implementar customização
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(3600000)
        local businesses = DB.getAllBusinesses()
        for _, business in pairs(businesses) do
            DB.updateBusinessIncome(business.name, Config.Businesses.IncomePerHour)
            DB.deductBusinessExpenses(business.name, Config.Businesses.Expenses)
        end
    end
end)
