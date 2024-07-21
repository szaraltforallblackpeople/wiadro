ESX.RegisterUsableItem('lufka', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    if xPlayer.getInventoryItem('weed').count >= 1 then
        xPlayer.showNotification('Nabiłeś lufke')
        xPlayer.removeInventoryItem('weed', 1)
        xPlayer.removeInventoryItem('lufka', 1)
        xPlayer.addInventoryItem('nabitalufka', 1)
    else 
        xPlayer.showNotification("Nie masz czym nabić lufki")
    end
end)

ESX.RegisterUsableItem('nabitalufka', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    if xPlayer.getInventoryItem('water').count >= 1 and xPlayer.getInventoryItem('lighter').count >= 1 then
        xPlayer.removeInventoryItem('water', 1)
        xPlayer.removeInventoryItem('nabitalufka', 1)
        xPlayer.triggerEvent("kriss:jebnijTloka")
    else 
        xPlayer.showNotification("Nie masz posiadasz wymaganych przedmiotow")
    end
end)
