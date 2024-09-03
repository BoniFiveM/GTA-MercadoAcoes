-- Desenvolvido por Marcos Boni
-- Funções utilitárias para o cálculo do preço das ações e outras operações gerais.

local Config = require("config")

local function calculateStockPrice(companyName)
    local price = Config.StockMarket.InitialPrices[companyName]
    price = price + price * (math.random() * Config.StockMarket.Volatility * 2 - Config.StockMarket.Volatility)
    return math.max(price, 0)
end

return {
    calculateStockPrice = calculateStockPrice
}
