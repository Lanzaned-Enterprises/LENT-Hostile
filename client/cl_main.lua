-- [[ QBCore Object ]] --
if GetResourceState('qb-core') == "started" then
    QBCore = exports['qb-core']:GetCoreObject()
elseif GetResourceState('es_extended') == "started" then
    ESX = exports["es_extended"]:getSharedObject()
end

-- [[ Get the PedSpawned Return + The table ]] --
local pedSpawned = false
local PedCreated = {}

-- [[ When the resource stops delete all the peds ]] -- 
AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        RemoveResourcePeds()
    end
end)

-- [[ Delete the Ped ]] --
function RemoveResourcePeds()
    if pedSpawned then
        for _, v in pairs(PedCreated) do
            DeletePed(v)
        end
    end
end

-- [[ Check if the Ped is dead and delete afther 1 Minute ]] --
CreateThread(function()
    while true do
        Wait(5000)
        if pedSpawned then
            for _, v in pairs(PedCreated) do
                if IsEntityDead(v) then
                    DeletePed(v)
                end
            end
        end
    end
end)

-- [[ Singualar Thread ]] --
CreateThread(function()
    for k, v in pairs(Config.Placement) do
        if pedSpawned then
            return
        end

        for k, v in pairs(Config.Placement) do
            if not PedCreated[k] then
                PedCreated[k] = {}
            end

            local current = v["Ped"]
            current = type(current) == 'string' and joaat(current) or current
            RequestModel(current)

            while not HasModelLoaded(current) do
                Wait(0)
            end

            local coords = v['Coords']

            -- The coords + heading of the Ped
            PedCreated[k] = CreatePed(0, current, coords.x, coords.y, coords.z, coords.w, false, false)

            -- Target Stuff..
            if v["Target"] then
                -- [[ This is Work in Progress]]
            end

            if v["Hostile"] then
                SetPedAsEnemy(PedCreated[k], true) -- Ped is now an enemy
                SetPedCombatMovement(PedCreated[k], 2) -- Offensive but will take cover
                SetPedCombatRange(PedCreated[k], 1) -- Medium Range
                SetPedAlertness(PedCreated[k], 3) -- Unsure but recommanded
                SetPedCombatAttributes(PedCreated[k], 46, true) -- Always fight
                SetPedCombatAttributes(PedCreated[k], 5, true) -- Can Fight without weapons
                SetPedCombatAttributes(PedCreated[k], 0, true) -- Make use of cover
                if v["Weapon"] then
                    GiveWeaponToPed(PedCreated[k], v["Weapon_Hash"], 999, false, false) -- Give them the specified weapon with ammo
                end
                SetPedRelationshipGroupHash(PedCreated[k], GetHashKey("HATES_PLAYER")) -- Makes them HATE the player
                SetPedCanSwitchWeapon(PedCreated[k], true) -- Allow them to switch weapon if applicible

                SetPedDropsWeaponsWhenDead(PedCreated[k], false) -- Stops the ped from dropping the weapon
            end
        end
    
        pedSpawned = true
    end
end)