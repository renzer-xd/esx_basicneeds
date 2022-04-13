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

local TO_USE = false
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent(RZ.Base.getSharedObject, function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)



CLIENT = {
    CreateZone = function()
        while true do 
            local SleepThread = 1000
            local playerPed = PlayerPedId()
            local coords = GetEntityCoords(playerPed)
            for k,v in pairs(RZ.Zone) do
                if GetDistanceBetweenCoords(coords,v.Pos, true) < v.Radius then
                    SleepThread = 0
                    RZFUNC.DRAWTXT(0.960, 0.600, 1.0,1.0,0.55, RZ.T['HEADTEXT'] , 255,255,255,255)
                end
            end
            Wait(SleepThread)
        end
    end,
    UseItem = function(key)
        print(ESX.DumpTable(key))
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        local MyRZ = RZ.UseItem[key]
        
        local Item = k
        if not TO_USE then
            TO_USE = true
            if MyRZ.NeedZone then
                for k, v in pairs(RZ.Zone) do
                    if GetDistanceBetweenCoords(coords,v.Pos, true) < v.Radius then
                        local x,y,z = table.unpack(GetEntityCoords(playerPed))
                        local prop = CreateObject(GetHashKey(MyRZ.Prop.Name), x, y, z + 0.2, true, true, true)
                        local boneIndex = GetPedBoneIndex(playerPed, MyRZ.Prop.BoneIndex)
                        AttachEntityToEntity(prop, playerPed, boneIndex, MyRZ.Prop.xPos, MyRZ.Prop.yPos, MyRZ.Prop.zPos, MyRZ.Prop.xRot, MyRZ.Prop.yRot, MyRZ.Prop.zRot, true, true, false, true, 1, true)
                        TriggerEvent('esx:showNotification', ('Wait  ~y~%s  ~w~Second'):format(MyRZ.Time))
                        ESX.Streaming.RequestAnimDict(MyRZ.AnimDict.Anim, function()
                            TaskPlayAnim(playerPed, MyRZ.AnimDict.Anim, MyRZ.AnimDict.Dict, 8.0, -8, -1, 49, 0, 0, 0, 0)
                            Citizen.Wait(MyRZ.Time*1000)
                            ClearPedSecondaryTask(playerPed)
                            DeleteObject(prop)
                            for k,v in pairs(MyRZ.Status) do
                                if v.Action == 'add' then
                                    TriggerEvent('esx_status:add', v.Type,v.Count*10000)
                                elseif v.Action == 'remove' then
                                    TriggerEvent('esx_status:remove', v.Type,v.Count*10000)
                                end
                            end
                            TriggerServerEvent(GetName(':sv:removeitem'),key)
                            TO_USE = false
                        end)
                    else
                        Notify_client(RZ.T['NeedZone'],'error')
                        TO_USE = false
                    end
                end
            else 
                local x,y,z = table.unpack(GetEntityCoords(playerPed))
                local prop = CreateObject(GetHashKey(MyRZ.Prop.Name), x, y, z + 0.2, true, true, true)
                local boneIndex = GetPedBoneIndex(playerPed, MyRZ.Prop.BoneIndex)
                AttachEntityToEntity(prop, playerPed, boneIndex, MyRZ.Prop.xPos, MyRZ.Prop.yPos, MyRZ.Prop.zPos, MyRZ.Prop.xRot, MyRZ.Prop.yRot, MyRZ.Prop.zRot, true, true, false, true, 1, true)
                TriggerEvent('esx:showNotification', ('Wait  ~y~%s  ~w~Second'):format(MyRZ.Time))
                ESX.Streaming.RequestAnimDict(MyRZ.AnimDict.Anim, function()
                    TaskPlayAnim(playerPed, MyRZ.AnimDict.Anim, MyRZ.AnimDict.Dict, 8.0, -8, -1, 49, 0, 0, 0, 0)
                    Citizen.Wait(MyRZ.Time*1000)
                    ClearPedSecondaryTask(playerPed)
                    DeleteObject(prop)
                    for k,v in pairs(MyRZ.Status) do
                        if v.Action == 'add' then
                            TriggerEvent('esx_status:add', v.Type,v.Count*10000)
                        elseif v.Action == 'remove' then
                            TriggerEvent('esx_status:remove', v.Type,v.Count*10000)
                        end
                    end
                    TriggerServerEvent(GetName(':sv:removeitem'),key)
                    TO_USE = false
                end)
            end
        else
            Notify_client(RZ.T['Wait'],'info')
        end
    end
}


Citizen.CreateThread(CLIENT.CreateZone)

RegisterNetEvent(GetName(':cl:useitem'),CLIENT.UseItem)
