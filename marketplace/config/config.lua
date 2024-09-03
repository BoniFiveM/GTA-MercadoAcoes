-- Desenvolvido por Marcos Boni
-- Configurações para o sistema de mercado de ações e negócios.
-- Define preços iniciais das ações, volatilidade, intervalo de atualização, impacto de eventos no mercado,
-- e detalhes sobre preços, receitas e despesas dos negócios.

Config = {}

Config.StockMarket = {
    InitialPrices = {
        CompanyA = 100,
        CompanyB = 150
    },
    Volatility = 0.05,
    UpdateInterval = 30000,
    EventImpact = {
        News = 0.1,
        Crisis = 0.3
    }
}

Config.Businesses = {
    InitialPrice = 500000,
    IncomePerHour = 5000,
    Expenses = {
        Employees = 2000,
        Maintenance = 1000
    }
}
