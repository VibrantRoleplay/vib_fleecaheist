local QBCore = exports["qb-core"]:GetCoreObject()

-------------
--Variables--
-------------

------------------
--Security Stuff--
------------------

RegisterNetEvent('banks:client:upgradesecurity', function(data)
    local upgradeItem = exports.ox_inventory:Search('count', Config.SecurityUpgradeItem)
    local mainframeCode = lib.callback.await('banks:server:getmainframecode', source)
    local bankInfo = data.bankInfo.label

    if upgradeItem >= 1 then
        local input = lib.inputDialog('Banks Mainframe Security Code', {
            'Security Code',
        })

        if not input then return end
        local userInput = tonumber(input[1])

        if userInput == mainframeCode then
            TriggerServerEvent('banks:server:UpdateBankSecurity', bankInfo)
        end
    else
        lib.notify({
            title = "Attention",
            description = "You don't have the right equipment for this!",
            type = 'inform'
        })
    end
end)

---------------------
--Main heist events--
---------------------

RegisterNetEvent('banks:client:keypad', function(data)
    local bankSecurity = lib.callback.await('banks:server:GetbankSecurity', false, data.bankInfo.label)
    local hackerItem = exports.ox_inventory:Search('count', Config.HackerItem)

    if bankSecurity.hasBeenRobbed then
        local alert = lib.alertDialog({
            header = "Previously robbed",
            content = data.bankInfo.label.." has already been robbed ... greedy little shit",
            centered = true,
        })
        return
    end

    if hackerItem <= 0 then
        lib.notify({
            title = 'Attention',
            description = 'You lack the tools for this',
            type = 'error',
        })
        return
    end

    local copCount = lib.callback.await('banks:server:CheckCopCount', false)
    
    if copCount >= Config.Cops then
        exports['boii_minigames']:chip_hack({
            style = 'default', -- Style template
            loading_time = 8000, -- Total time to complete loading sequence in (ms)
            chips = math.random(4, 6), -- Amount of chips required to find
            timer = 15000 -- Total allowed game time in (ms)
        }, function(success)
            if success then
                if bankSecurity.level == 0 then timeLeft = 15 end 
                if bankSecurity.level == 1 then timeLeft = 13 end 
                if bankSecurity.level == 2 then timeLeft = 11 end 
                if bankSecurity.level == 3 then timeLeft = 9 end 
                if bankSecurity.level == 4 then timeLeft = 7 end 
                if bankSecurity.level == 5 then timeLeft = 6 end

                TriggerServerEvent('banks:server:OpenDoor', data, timeLeft)
                SpawnVaultGuards(data.bankInfo)
                exports['ps-dispatch']:FleecaBankRobbery(camId)
            else
                lib.notify({
                    title = "Attention",
                    description = "You failed the hack!",
                    type = 'error'
                })
            end
        end)
    else
        lib.notify({
            title = 'Attention',
            description = 'Not enough cops!',
            type = 'error'
        })
    end
end)

RegisterNetEvent('banks:client:CreateLockerZones', function(data)
    for k, v in pairs(data.bankInfo.lockers) do
        local zone_id = exports.ox_target:addBoxZone({
            coords = v.coords,
            size = v.size,
            rotation = v.rotation,
            debug = Config.Debug,
            options = {
                {
                    name = 'banks_locker_'..k,
                    event = 'banks:client:lootbox',
                    icon = 'fa-solid fa-lock',
                    iconColour = "red",
                    label = 'Break Open Locker',
                    distance = 1.0,
                    args = {
                        lootBoxIndex = k,
                        bankInfo = v,
                        fullBankInfo = data,
                    }
                },
            }
        })
        TriggerServerEvent('banks:server:UpdateZoneId', k, zone_id)
    end
end)

RegisterNetEvent('banks:client:lootbox', function(data)
    local lootbox = data.args.lootBoxIndex
    local fullBankInfo = data.args.fullBankInfo
    local bankInfo = data.args.bankInfo
    local drillItem = exports.ox_inventory:Search('count', Config.LockerItem)

    if drillItem >= 1 then

        ----------------------------------------
        --UNCOMMENT THIS TO USE A PROGRESS BAR--
        ----------------------------------------

        -- lib.requestNamedPtfxAsset("core")
        -- UseParticleFxAssetNextCall('core')
        -- local effect = StartParticleFxLoopedAtCoord('ent_ray_finale_vault_sparks', bankInfo.coords.x, bankInfo.coords.y, bankInfo.coords.z, 0, 0, 0, 0x3F800000, 0, 0, 0, 0)

        -- if lib.progressCircle({
        --     duration = math.random(7500, 15000),
        --     useWhileDead = false,
        --     canCancel = true,
        --     disable = {
        --         car = true,
        --         move = true,
        --         combat = true,
        --     },
        --     anim = {
        --         dict = 'anim@heists@fleeca_bank@drilling',
        --         clip = 'drill_straight_idle'
        --     },
        --     prop = {
        --         model = `hei_prop_heist_drill`,
        --         bone = 28422,
        --         pos = vec3(0.00, 0, -0.01),
        --         rot = vec3(-220.0, 90.0, -180.0)
        --     },
        -- }) then 
        --     TriggerServerEvent('banks:server:reward', lootbox, bankInfo, fullBankInfo)
        --     StopParticleFxLooped(effect, 0)
        -- else
        --     lib.notify({
        --         title = 'Canceled',
        --         description = 'Canceled',
        --         type = 'error'
        --     })
        --     StopParticleFxLooped(effect, 0)
        -- end

        ------------------------------------------------------------------------
        --UNCOMMENT THIS TO USE DRILL MINI-GAME, CHECK README FOR REQUIREMENTS--
        ------------------------------------------------------------------------

        while not HasAnimDictLoaded("anim_heist@hs3f@ig9_vault_drill@drill@") do
            RequestAnimDict("anim_heist@hs3f@ig9_vault_drill@drill@")
            Wait(1)
        end
        while not HasModelLoaded(GetHashKey('hei_prop_heist_drill')) do
            RequestModel(GetHashKey('hei_prop_heist_drill'))
            Wait(1)
        end
        while not HasModelLoaded(GetHashKey('hei_p_m_bag_var22_arm_s')) do
            RequestModel(GetHashKey('hei_p_m_bag_var22_arm_s'))
            Wait(1)
        end

        local player = cache.ped
        local playerCoords = GetEntityCoords(player)
        local playerRotation = GetEntityRotation(player)
        local drillObject = CreateObject(GetHashKey('hei_prop_heist_drill'), playerCoords, true, true, true)
        local bagObject = CreateObject(GetHashKey('hei_p_m_bag_var22_arm_s'), playerCoords, true, true, true)
        local drillScene = NetworkCreateSynchronisedScene(playerCoords.xy, playerCoords.z+.17, playerRotation, 2, true, false, -1, 0, 1.0)

        NetworkAddPedToSynchronisedScene(player, drillScene, "anim_heist@hs3f@ig9_vault_drill@drill@", "intro", 1.5, -4.0, 1, 16, 1148846080, 0)
        NetworkAddEntityToSynchronisedScene(drillObject, drillScene, "anim_heist@hs3f@ig9_vault_drill@drill@", "intro_drill_bit", 1.0, 1.0, 1)
        NetworkAddEntityToSynchronisedScene(bagObject, drillScene, "anim_heist@hs3f@ig9_vault_drill@drill@", "bag_intro", 1.0, 1.0, 1)
        NetworkAddSynchronisedSceneCamera(drillScene,"anim_heist@hs3f@ig9_vault_drill@drill@",'intro_cam')
        NetworkStartSynchronisedScene(drillScene)
        Wait(6000)

        TriggerEvent("Drilling:Start",function(success)
            if (success) then
                TriggerServerEvent('banks:server:reward', lootbox, bankInfo, fullBankInfo)
                NetworkStopSynchronisedScene(drillScene)
                DeleteObject(drillObject)
                DeleteObject(bagObject)
                RemoveAnimDict('anim_heist@hs3f@ig9_vault_drill@drill@')
                RemovePtfxAsset('core')
            else
                lib.notify({
                    title = 'Failed',
                    description = "That didn't go so well",
                    type = 'error'
                })
                NetworkStopSynchronisedScene(drillScene)
                DeleteObject(drillObject)
                DeleteObject(bagObject)
                RemoveAnimDict('anim_heist@hs3f@ig9_vault_drill@drill@')
                RemovePtfxAsset('core')
            end
        end, bankInfo.coords)
    else
        lib.notify({
            title = 'Attention',
            description = "You don't have the right tool for this!",
            type = 'inform'
        })
    end
end)

-----------------------
--Security Panel Menu--
-----------------------

RegisterNetEvent('banks:client:PanelMenu', function(data)
    local playerJob = lib.callback.await('banks:server:GetPlayerJob', false)
    local headerMenu = {}
    local bankIndex = data.args.BankIndex
    local bankInfo = data.args.BankInfo
    local bankSecurity = lib.callback.await('banks:server:GetbankSecurity', false, bankInfo.label)

    if playerJob.name == Config.PoliceJob then
        if bankSecurity.level >= Config.SecurityMaxLevel then
            headerMenu[#headerMenu + 1] = {
                title = bankInfo.label,
                description = "This banks security level can't get any higher, it's already level: "..bankSecurity.level,
                icon = 'fa-solid fa-shield',
                iconColor = "white",
                readOnly = true
            }
        else
            headerMenu[#headerMenu + 1] = {
                title = bankInfo.label,
                description = "This banks security level is currently: "..bankSecurity.level.." \n\nUpgrade it?",
                icon = 'fa-solid fa-shield-halved',
                iconColor = "blue",
                event = 'banks:client:upgradesecurity',
                args = {
                    bankInfo = bankInfo,
                }
            }
        end

        headerMenu[#headerMenu + 1] = {
            title = bankInfo.label,
            description = "Access Vault",
            onSelect = function(args)
                AccessVault(args)
            end,
            icon = 'fa-solid fa-door-closed',
            iconColor = "orange",
            args = {
                bankInfo = bankInfo,
                bankIndex = bankIndex,
            }
        }
    else
        headerMenu[#headerMenu + 1] = {
            title = bankInfo.label,
            description = "Hack security panel",
            event = 'banks:client:keypad',
            icon = 'fa-solid fa-code',
            iconColor = "green",
            args = {
                bankInfo = bankInfo,
                bankIndex = bankIndex,
            }
        }
    end

    lib.registerContext({
        id = 'panel_menu',
        title = bankInfo.label,
        options = headerMenu
    })

    lib.showContext('panel_menu')
end)

------------------
--Mainframe menu--
------------------

RegisterNetEvent('banks:client:MainframeMenu', function()
    local playerJob = lib.callback.await('banks:server:GetPlayerJob', false)
    local code = lib.callback.await('banks:server:getmainframecode')
    local headerMenu = {}

    if playerJob.name == Config.PoliceJob then
        if playerJob.grade.level >= 3 then
            headerMenu[#headerMenu + 1] = {
                title = "Access Code",
                description = "The current Mainframe code is: "..code,
                icon = 'fa-solid fa-code',
                iconColor = "green",
                readOnly = true
            }
        end

        headerMenu[#headerMenu + 1] = {
            title = "Camera Control",
            description = "View cameras",
            icon = 'fa-solid fa-camera',
            iconColor = "white",
            event = 'qb-policejob:client:OpenInput',
        }
    end

    lib.registerContext({
        id = 'mainframe_menu',
        title = "Police Mainframe",
        options = headerMenu
    })

    lib.showContext('mainframe_menu')
end)

RegisterNetEvent('banks:client:RemoveZone', function(zoneId)
    exports.ox_target:removeZone(zoneId)
end)

CreateThread(function()
    for k, v in pairs(Config.Banks) do
        local zone_id = exports.ox_target:addSphereZone({
            coords = v.coords,
            radius = 0.3,
            debug = Config.Debug,
            options = {
                {
                    event = "banks:client:PanelMenu",
                    icon = "fa-solid fa-brain",
                    iconColor = "green",
                    label = "Open panel",
                    distance = 2.0,
                    args = {
                        BankIndex = k,
                        BankInfo = v,
                    }
                },
            }
        })
        TriggerServerEvent('banks:server:UpdateSecurityTable', v)
    end

    for k, v in pairs(Config.PoliceMainframe) do
        local zone_id = exports.ox_target:addBoxZone({
            coords = v.coords,
            size = vec3(1.0, 1.0, 1.0),
            rotation = 45,
            debug = Config.Debug,
            options = {
                {
                    event = 'banks:client:MainframeMenu',
                    icon = 'fa-solid fa-brain',
                    iconColor = "brown",
                    label = 'Open Police Mainframe',
                },
            }
        })
    end
end)

--------------
--Door Stuff--
--------------

function AccessVault(data)
    local player = cache.ped
    local playerCoords = GetEntityCoords(player)
    local pedCoords = data.bankInfo.security.spawnLocation
    local hallwayCoords = data.bankInfo.security.hallwayCoords
    local keypadCoords = data.bankInfo.coords
    local bankSecurity = lib.callback.await('banks:server:GetbankSecurity', false, data.bankInfo.label)
    local duration = data.bankInfo.security.vaultAccessDuration

    lib.requestModel(data.bankInfo.security.pedModel)
    local bankPed = CreatePed(1, data.bankInfo.security.pedModel, pedCoords.x, pedCoords.y, pedCoords.z, pedCoords.w, true)

    TaskGoStraightToCoord(bankPed, hallwayCoords.x, hallwayCoords.y, hallwayCoords.z, 1.0, -1)
    Wait(2000)
    TaskTurnPedToFaceCoord(bankPed, keypadCoords.x, keypadCoords.y, keypadCoords.z, 1000)
    TaskGoStraightToCoord(bankPed, keypadCoords.x, keypadCoords.y, keypadCoords.z, 1.0, -1)
    Wait(6500)
    TaskTurnPedToFaceCoord(bankPed, playerCoords.x, playerCoords.y, playerCoords.z, 1000)

    local alert = lib.alertDialog({
        header = 'Vault Access',
        content = "Right ... The vaults open for you, but be warned it's on a timer that we can't alter  \n\nYou've got: "..duration.." minute/s... Please don't get locked in!",
        centered = true,
        cancel = true
    })
    SetPedAsNoLongerNeeded(bankPed)
    TriggerServerEvent('banks:server:OpenVault', data, duration)
end

RegisterNetEvent('banks:client:CloseDoor', function(data)
    CloseBankDoor(data)
end)

RegisterNetEvent('banks:client:OpenDoor', function(data)
    OpenBankDoor(data)
end)

function OpenBankDoor(data)
    local object = GetClosestObjectOfType(data.coords.x, data.coords.y, data.coords.z, 5.0, data.object, false, false, false)
    local entHeading = data.heading.closed
    local bankSecurity = lib.callback.await('banks:server:GetbankSecurity', false, data.label)
    local sleep = 10

    if bankSecurity.level == 0 then sleep = 50  end
    if bankSecurity.level == 1 then sleep = 100 end
    if bankSecurity.level == 2 then sleep = 150 end
    if bankSecurity.level == 3 then sleep = 200 end
    if bankSecurity.level == 4 then sleep = 250 end
    if bankSecurity.level == 5 then sleep = 300 end

    if object ~= 0 then
        CreateThread(function()
            while entHeading ~= data.heading.open do
                SetEntityHeading(object, entHeading - 10)
                entHeading -= 0.5

                Wait(sleep)
            end
        end)
    end
end

function CloseBankDoor(data)
    local object = GetClosestObjectOfType(data.coords.x, data.coords.y, data.coords.z, 5.0, data.object, false, false, false)
    local entHeading = data.heading.open
    local bankSecurity = lib.callback.await('banks:server:GetbankSecurity', false, data.label)
    local sleep = 10

    if bankSecurity.level == 0 then sleep = 150 end
    if bankSecurity.level == 1 then sleep = 125 end
    if bankSecurity.level == 2 then sleep = 100 end
    if bankSecurity.level == 3 then sleep = 75 end
    if bankSecurity.level == 4 then sleep = 50 end
    if bankSecurity.level == 5 then sleep = 25 end

    if object ~= 0 then
        CreateThread(function()
            while entHeading ~= data.heading.closed do
                if entHeading > 360.0 then
                    entHeading = 0.0
                end
                SetEntityHeading(object, entHeading + 0.3)
                entHeading += 0.5
                
                Wait(sleep)
            end
        end)
    end
end

function SpawnVaultGuards(bankInfo)
    local player = cache.ped
    local playerCoords = GetEntityCoords(player)
    local bankSecurity = lib.callback.await('banks:server:GetbankSecurity', false, bankInfo.label)
    local guardSpawn = bankInfo.vaultGuard.spawnLocation
    local spawnAmount = 1

    if bankSecurity.level < 3 then
        spawnAmount = 1
    else
        spawnAmount = 2
    end

    for i = 1, spawnAmount do
        lib.requestModel(bankInfo.vaultGuard.pedModel)
        local bankPed = CreatePed(1, bankInfo.vaultGuard.pedModel, guardSpawn.x, guardSpawn.y, guardSpawn.z, guardSpawn.w, true)

        GiveWeaponToPed(bankPed, "weapon_pistol", 100, false, true)
        TaskGoToCoordWhileAimingAtCoord(bankPed, playerCoords, playerCoords, 1.0, false, 2.5, 0.5, true, 0, 0)
        Wait(2500)
        TaskAimGunAtCoord(bankPed, playerCoords.x, playerCoords.y, playerCoords.z, -1, true)
        Wait(10000)
        TaskSmartFleePed(bankPed, player, 100.0, -1, true, true)
        Wait(7500)
        DeleteEntity(bankPed)
	end
end