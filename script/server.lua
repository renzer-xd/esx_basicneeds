--[[    
██████╗ ███████╗███╗   ██╗███████╗███████╗██████╗     ██████╗ ███████╗██╗   ██╗███████╗██╗      ██████╗ ██████╗ ███████╗██████╗ 
██╔══██╗██╔════╝████╗  ██║╚══███╔╝██╔════╝██╔══██╗    ██╔══██╗██╔════╝██║   ██║██╔════╝██║     ██╔═══██╗██╔══██╗██╔════╝██╔══██╗
██████╔╝█████╗  ██╔██╗ ██║  ███╔╝ █████╗  ██████╔╝    ██║  ██║█████╗  ██║   ██║█████╗  ██║     ██║   ██║██████╔╝█████╗  ██████╔╝
██╔══██╗██╔══╝  ██║╚██╗██║ ███╔╝  ██╔══╝  ██╔══██╗    ██║  ██║██╔══╝  ╚██╗ ██╔╝██╔══╝  ██║     ██║   ██║██╔═══╝ ██╔══╝  ██╔══██╗
██║  ██║███████╗██║ ╚████║███████╗███████╗██║  ██║    ██████╔╝███████╗ ╚████╔╝ ███████╗███████╗╚██████╔╝██║     ███████╗██║  ██║
╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝╚══════╝╚══════╝╚═╝  ╚═╝    ╚═════╝ ╚══════╝  ╚═══╝  ╚══════╝╚══════╝ ╚═════╝ ╚═╝     ╚══════╝╚═╝  ╚═╝
Discord: https://discord.gg/cD4tUF2Bza
Facebook: https://www.facebook.com/RenZerDeveloperShop
WebShop : https://renzershop.com
💕 "Thanks for your support" 💕
]]

ESX = nil
TriggerEvent(RZ.Base.getSharedObject, function(obj) ESX = obj end)

SERVER = {
    UseItem = function()
        for k,v in pairs(RZ.UseItem) do
            ESX.RegisterUsableItem(k, function(source)
                local xPlayer = ESX.GetPlayerFromId(source)	
                TriggerClientEvent(GetName(':cl:useitem'), source,k)
                RZ.Server_Close_Inventory(source)
            end)
        end
    end,
    RemoveItem = function(item)
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.removeInventoryItem(item, 1)
    end
}

CreateThread(SERVER.UseItem)

RegisterNetEvent(GetName(':sv:removeitem'),SERVER.RemoveItem)