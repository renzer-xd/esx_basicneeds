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

local IsDead = false

AddEventHandler('esx_basicneeds:resetStatus', function()
	TriggerEvent('esx_status:set', 'hunger', 150000)
	TriggerEvent('esx_status:set', 'thirst', 150000)
end)

RegisterNetEvent('esx_basicneeds:healPlayer')
AddEventHandler('esx_basicneeds:healPlayer', function()

	TriggerEvent('esx_status:set', 'hunger', 1000000)
	TriggerEvent('esx_status:set', 'thirst', 1000000)


	local playerPed = PlayerPedId()
	SetEntityHealth(playerPed, GetEntityMaxHealth(playerPed))
end)



AddEventHandler('esx:onPlayerDeath', function()
	IsDead = true
end)

AddEventHandler('playerSpawned', function(spawn)
	if IsDead then
		TriggerEvent('esx_status:getStatus', 'hunger', function(status)
			if status.val <= 100000 then
				TriggerEvent('esx_basicneeds:resetStatus')
			end
		end)
		TriggerEvent('esx_status:getStatus', 'thirst', function(status)
			if status.val <= 100000 then
				TriggerEvent('esx_basicneeds:resetStatus')
			end
		end)

	end

	IsDead = false
end)

AddEventHandler('esx_status:loaded', function(status)

	TriggerEvent('esx_status:registerStatus', 'hunger', 1000000, '#FFFF00',
		function(status)
			return false 
		end, function(status)
			status.remove(150)
		end
	)

	TriggerEvent('esx_status:registerStatus', 'thirst', 1000000, '#0099FF',

		function(status)
			return false 
		end, function(status)
			status.remove(150)
		end
	)


	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(1000)

			local playerPed  = PlayerPedId()
			local prevHealth = GetEntityHealth(playerPed)
			local health     = prevHealth

			TriggerEvent('esx_status:getStatus', 'hunger', function(status)
				if status.val == 0 then
					if prevHealth <= 150 then
						health = health - 5
					else
						health = health - 1
					end
				end
			end)

			TriggerEvent('esx_status:getStatus', 'thirst', function(status)
				if status.val == 0 then
					if prevHealth <= 150 then
						health = health - 5
					else
						health = health - 1
					end
				end
			end)

		
			if health ~= prevHealth then
				SetEntityHealth(playerPed, health)
			end
		end
	end)
end)