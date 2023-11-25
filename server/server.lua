local QBCore = exports["qb-core"]:GetCoreObject()

-------------
--Variables--
-------------

local MainframeCode = math.random(1111, 9999)
local bankSecurity = {}
local lockerZones = {}

-------------
--Callbacks--
-------------

lib.callback.register('banks:server:getmainframecode', function(source)
    return MainframeCode
end)

lib.callback.register('banks:server:GetbankSecurity', function(source, data)
    return bankSecurity[data]
end)

lib.callback.register('banks:server:GetPlayerJob', function(source)
    local player = QBCore.Functions.GetPlayer(source)
    local playerJob = player.PlayerData.job

    return playerJob
end)

----------
--Events--
----------

RegisterNetEvent('banks:server:UpdateSecurityTable', function(data)
    bankSecurity[data.label] = {
        level = 0,
        hasBeenRobbed = false,
        zoneId = nil,
    }
end)

RegisterNetEvent('banks:server:UpdateZoneId', function(data, zoneId)
    lockerZones[data] = {
        zoneId = zoneId,
    }
end)

RegisterServerEvent('banks:server:UpdateBankSecurity', function(data)
    if exports.ox_inventory:RemoveItem(source, Config.SecurityUpgradeItem, 1) then
        bankSecurity[data].level = bankSecurity[data].level + 1
        lib.notify(source, {
            title = 'Attention',
            description = 'You upgraded the security level of this vault',
            type = 'success',
        })
    end
end)

--------------
--Door Stuff--
--------------

RegisterServerEvent('banks:server:OpenDoor', function(data, mins)
    if exports.ox_inventory:RemoveItem(source, Config.HackerItem, 1) then
        TriggerClientEvent('banks:client:OpenDoor', -1, data.bankInfo)
        TriggerClientEvent('ox_lib:alertDialog', source, {
            header = "Current Security Level: "..bankSecurity[data.bankInfo.label].level,
            content = 'Time Until Doors Close: '..mins..' mins',
            centered = true
        })
        TriggerClientEvent('banks:client:CreateLockerZones', -1, data)
        TriggerEvent('banks:server:CloseDoor', data, mins)
        bankSecurity[data.bankInfo.label].hasBeenRobbed = true
    end
end)

RegisterServerEvent('banks:server:OpenVault', function(data, mins) -- Open the vault as a cop
    TriggerClientEvent('banks:client:OpenDoor', -1, data.bankInfo)
    TriggerEvent('banks:server:CloseDoor', data, mins)
end)

RegisterServerEvent('banks:server:CloseDoor', function(data, mins)
    local milliseconds = 0

    if mins ~= nil then
        local seconds = mins    * 60
        milliseconds  = seconds * 1000
    end

    Wait(milliseconds)
    TriggerClientEvent('banks:client:CloseDoor', -1, data.bankInfo)
end)

RegisterServerEvent('banks:server:reward', function(lootbox, bankInfo, fullBankInfo)
    local lootTable = bankInfo.rewards
    local lootedReward = math.random(1, #lootTable)
    local item = lootTable[lootedReward].item
    local amount = lootTable[lootedReward].amount
    local zoneId = lockerZones[lootbox].zoneId

    if exports.ox_inventory:CanCarryItem(source, item, amount) then
        TriggerClientEvent("banks:client:RemoveZone", -1, zoneId)
        exports.ox_inventory:AddItem(source, item, amount)
        if item == "money" then 
            exports["vib-lib"]:economy({
                ["resource"] = GetCurrentResourceName(),
                ["name"] = "Reward",
                ["amount"] = amount,
                ["source"] = source,
            })
        end
    else
        lib.notify(source, {
            title = 'Attention',
            description = 'Ivnentory full',
            type = 'error',
        })
    end
end)
 