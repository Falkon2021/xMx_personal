ESX = exports.es_extended:getSharedObject()

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
end)

Citizen.CreateThread(function()
    Citizen.Wait(1000)
    for k,hex in pairs(Personal) do
        TriggerEvent('gridsystem:registerMarker', {
            name = 'personal'..k,
            pos = hex.inventory,
            scale = vector3(0.5,0.5,0.5),
            permission = nil,
            msg = 'Premi ~INPUT_CONTEXT~ per accedere al inventario personale di ' ..k,
            control = 'E',
            type = 20,
            color = { r = 100, g = 0, b = 255 },
            action = function()
                if ESX.PlayerData.identifier == hex.hex then
                    exports.ox_inventory:openInventory('stash', k)
                else
                    ESX.ShowNotification('Non sei '..k)
                end
            end,
            onExit = function()
                ESX.UI.Menu.CloseAll()
            end
        })
    end
end)