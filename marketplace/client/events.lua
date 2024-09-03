-- Desenvolvido por Marcos Boni
-- Eventos do cliente para interações com o sistema de mercado de ações e negócios.

RegisterCommand('buyStock', function(source, args, rawCommand)
    local companyName = args[1]
    local amount = tonumber(args[2])
    buyStock(companyName, amount)
end, false)

RegisterCommand('sellStock', function(source, args, rawCommand)
    local companyName = args[1]
    local amount = tonumber(args[2])
    sellStock(companyName, amount)
end, false)

RegisterCommand('manageBusiness', function(source, args, rawCommand)
    local businessName = args[1]
    local action = args[2]
    -- Implementar chamada para gerenciar negócios
end, false)
