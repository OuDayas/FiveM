--[[
#################################################################
            Vehicles for job V1.0 By: OuDayas
#################################################################
]]

local Keys =
{
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX = nil
local PlayerData = {}
local JobSelected = ""
local MenuOpened = false
local MainMenu = RageUI.CreateMenu("Garage", "Garage");

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
	Citizen.Wait(5000)
end)
function table.empty (self)
    for _, _ in pairs(self) do
        return false
    end
    return true
end

function RageUI.PoolMenus:MainMenu()
	MainMenu:IsVisible(function(Items)
		for k2,v2 in pairs(Config.Vehicles) do
			for k3,v3 in ipairs(Config.Vehicles[k2]) do
				if k2 == JobSelected then
					Items:AddButton(v3.Name, nil, {RightLabel = _U('TakeVeh'), IsDisabled = false }, function(onSelected)
						if (onSelected) then
							local veicolo = GetClosestVehicle(v3.Pos.x, v3.Pos.y, v3.Pos.z, 6.0, 0, 71)
							if not DoesEntityExist(veicolo) then
								local AngleSPWN = 0+  v3.Heading
								ESX.Game.SpawnVehicle(v3.VehModel, {
									x = v3.Pos.x,
									y = v3.Pos.y,
									z = v3.Pos.z},
									AngleSPWN,
									function(vehicle)
									if Config.Joblist[JobSelected].Misc.DeleteVehByPlate == true then
										SetVehicleNumberPlateText(vehicle, Config.Joblist[JobSelected].Misc.Plate)
									end
									SetVehicleCustomPrimaryColour(vehicle, v3.PrimaryColor.x, v3.PrimaryColor.y, v3.PrimaryColor.z)
									SetVehicleCustomSecondaryColour(vehicle, v3.SecondaryColor.x, v3.SecondaryColor.y, v3.SecondaryColor.z)
									SetVehicleLivery(vehicle, v3.Livery)
									MenuOpened = false
									if(Config.Debug) then
										ESX.ShowNotification("Totale livree: " .. GetVehicleLiveryCount(vehicle))
										ESX.ShowNotification("Livrea selezionata: " .. v3.Livery)
									end
								end)
							else
								ESX.ShowNotification(_U('GarageOccupied'))
							end
						end
					end)
				end
			end
		end
	end, function() end)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		for k,v in pairs(Config.Joblist) do
			local playerPed = PlayerPedId()
			local coords    = GetEntityCoords(playerPed)
			if GetDistanceBetweenCoords(coords, Config.Joblist[k].Menu.Take, true) < 25.0 and PlayerData.job ~= nil and PlayerData.job.name == k then
				DrawMarker(36, Config.Joblist[k].Menu.Take, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 0, 255, 0, 100, false, true, 2, false, false, false, false)
				if GetDistanceBetweenCoords((coords), (Config.Joblist[k].Menu.Take), true) < 0.5 and MenuOpened == false then
					DisplayHelpText(_U('takeveh'))
					if IsControlJustReleased(1, 51) then
						MenuOpened = true
						JobSelected = k
						RageUI.Visible(MainMenu, not RageUI.Visible(MainMenu))
					end
				elseif GetDistanceBetweenCoords((coords), (Config.Joblist[k].Menu.Take), true) > 0.5 and MenuOpened == true then
					MenuOpened = false
				end
			end
			if RageUI.Visible(MainMenu) then
				MenuOpened = false
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		for k,v in pairs(Config.Joblist) do
			local playerPed = PlayerPedId()
			local coords    = GetEntityCoords(playerPed)
			if GetDistanceBetweenCoords(coords, Config.Joblist[k].Menu.Delete, true) < 25.0 and PlayerData.job ~= nil and PlayerData.job.name == k then
				DrawMarker(36, Config.Joblist[k].Menu.Delete, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 255, 0, 0, 100, false, true, 2, false, false, false, false)
				if IsPedInAnyVehicle(playerPed, false) and (GetDistanceBetweenCoords(coords, Config.Joblist[k].Menu.Delete, true) < 2.0) then
					local vehicle = ESX.Game.GetClosestVehicle({
						x = coords.x,
						y = coords.y,
						z = coords.z
					})
					local vehicleData = ESX.Game.GetVehicleProperties(vehicle)
					DisplayHelpText(_U('InputPickup'))
					if IsControlJustReleased(1, Keys['E']) then
						local vehicleData = ESX.Game.GetVehicleProperties(vehicle)
						if Config.Joblist[k].Misc.DeleteVehByPlate == true and vehicleData.plate == Config.Joblist[k].Misc.Plate then
							ESX.Game.DeleteVehicle(vehicle)
							print("MODEL: " .. vehicleData.model)
						elseif Config.Joblist[k].Misc.DeleteVehByPlate == false then
							for k2,v2 in pairs(Config.Vehicles) do
								for k3,v3 in ipairs(Config.Vehicles[k2]) do
									local vehiclehash = GetHashKey(v3.VehModel)
									if vehicleData.model == vehiclehash then
										print("HASH:" .. vehiclehash)
										print("MODEL: " .. vehicleData.model)
										ESX.Game.DeleteVehicle(vehicle)
									end
								end
							end
						end
					end
				end
			end
		end
	end
end)