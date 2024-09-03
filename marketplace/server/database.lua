-- Desenvolvido por Marcos Boni 
-- Desenvolvido por Marcos Boni
-- Gerencia a conexão e operações com o banco de dados.
-- Inclui funções para manipular jogadores e negócios.

local sqlite3 = require("lsqlite3")
local db = sqlite3.open("database.db")

function getPlayer(playerId)
    local player = {}
    for row in db:nrows("SELECT * FROM players WHERE id = " .. playerId) do
        player = row
    end
    return player
end

function updatePlayerMoney(playerId, amount)
    db:exec("UPDATE players SET money = " .. amount .. " WHERE id = " .. playerId)
end

function addStockToPlayer(playerId, companyName, amount)
    -- Implementar adição de ações
end

function removeStockFromPlayer(playerId, companyName, amount)
    -- Implementar remoção de ações
end

function getPlayerStock(playerId, companyName)
    -- Implementar recuperação de ações
end

function addBusinessToPlayer(playerId, businessName)
    -- Implementar adição de negócios
end

function getBusiness(businessName)
    -- Implementar recuperação de informações de negócios
end

function updateBusinessIncome(businessName, amount)
    -- Implementar atualização de receita
end

function deductBusinessExpenses(businessName, expenses)
    -- Implementar dedução de despesas
end

function getAllBusinesses()
    -- Implementar recuperação de todos os negócios
end

return {
    getPlayer = getPlayer,
    updatePlayerMoney = updatePlayerMoney,
    addStockToPlayer = addStockToPlayer,
    removeStockFromPlayer = removeStockFromPlayer,
    getPlayerStock = getPlayerStock,
    addBusinessToPlayer = addBusinessToPlayer,
    getBusiness = getBusiness,
    updateBusinessIncome = updateBusinessIncome,
    deductBusinessExpenses = deductBusinessExpenses,
    getAllBusinesses = getAllBusinesses
}
