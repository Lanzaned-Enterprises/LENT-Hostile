-- [[ Get all Shared Objects! ]] --
if GetResourceState("qb-core") == "started" then
    QBCore = exports['qb-core']:GetCoreObject()
end if GetResourceState('es_extended') == "started" then
    ESX = exports["es_extended"]:getSharedObject()
end

-- [[ Set Resource Notification State! ]] --
if Config.Framework['Enabled'] then
    resource = Config.Framework['Notify']
else
    resource = "gta"
end

-- [[ Notify Function ]] --
function Notify(text, type, time, title, src)
    if resource == 'qb' then
        if not src then QBCore.Functions.Notify(text, type, time)
        else TriggerClientEvent('QBCore:Notify', src, text, type, time) end
    elseif resource == 'esx' then
        if not src then ESX.ShowNotification(text, type, time)
        else TriggerClientEvent('esx:showNotification', src, text, type, time) end
    elseif resource == 'ps' then
        if not src then exports['ps-ui']:Notify(text, type, time)
        else TriggerClientEvent('LENT-Bridge:Client:Notify', text, type, time) end
    elseif resource == "ox" then
        if not src then TriggerEvent('ox_lib:notify', { title = title or "SYSTEM MESSAGE", description = text, type = type })
		else TriggerClientEvent('ox_lib:notify', src, { title = title or "SYSTEM MESSAGE", description = text, type = type }) end
    elseif resource == "gta" then
        if not src then
        BeginTextCommandThefeedPost("STRING")
        AddTextComponentSubstringKeyboardDisplay(text)
        EndTextCommandThefeedPostMessagetext("CHAR_DEFAULT", "CHAR_DEFAULT", true, 1, title or "SYSTEM MESSAGE", nil, text);
        EndTextCommandThefeedPostTicker(true, false)
        else TriggerClientEvent('LENT-Bridge:Client:Notify', text, type, time, title) end
    elseif resource == 'custom' then
        -- Insert Custom Notify
    end
end

RegisterNetEvent('LENT-Bridge:Client:Notify', function(text, type, time, title)
    Notify(text, type, time, title)
end) -- Small bridge to convert from server to client!

-- [[ ]] -- 