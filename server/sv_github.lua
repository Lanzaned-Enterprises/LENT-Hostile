--[[ Version Checker ]] --
local version = "000"

local DISCORD_WEBHOOK = ""
local DISCORD_NAME = "LENT - Hostile!"
local DISCORD_IMAGE = "https://cdn.discordapp.com/attachments/1026175982509506650/1026176123928842270/Lanzaned.png"

AddEventHandler("onResourceStart", function(resource)
    if resource == GetCurrentResourceName() then
        Version()
    end
end)

function Embed(color, name, message, footer)
    local content = {
        {
            ["color"] = color,
            ["title"] = " " .. name .. " ",
            ["description"] = message,
            ["footer"] = {
                ["text"] = " " .. footer .. " ",
            },
        }
    }
    PerformHttpRequest(DISCORD_WEBHOOK, function(err, text, headers) end, 
    'POST', json.encode({
        username = DISCORD_NAME, 
        embeds = content, 
        avatar_url = DISCORD_IMAGE
    }), { ['Content-Type'] = 'application/json '})
end

function Version()
    PerformHttpRequest("https://raw.githubusercontent.com/Lanzaned-Enterprises/LENT-Hostile/main/version.txt", function(err, text, headers)
        if (version > text) then -- Using Dev Branch
            print(" ")
            print("---------- LANZANED HOSTILE ----------")
            print("LENT-Hostile is using a development branch! Please update to stable ASAP!")
            print("Your Version: " .. version .. " Current Stable Version: " .. text)
            print("https://github.com/Lanzaned-Enterprises/LENT-Hostile")
            print("--------------------------------------")
            print(" ")
            checkUpdateEmbed(5242880, "Burger Shot Update Checker", "LENT-Hostile is using a development branch! Please update to stable ASAP!\nYour Version: " .. version .. " Current Stable Version: " .. text .. "\nhttps://github.com/Lanzaned-Enterprises/LENT-Hostile", "Script created by: https://discord.lanzaned.com")
        elseif (text < version) then -- Not updated
            print(" ")
            print("---------- LANZANED HOSTILE ----------")
            print("LENT-Hostile is not up to date! Please update!")
            print("Curent Version: " .. version .. " Latest Version: " .. text)
            print("https://github.com/Lanzaned-Enterprises/LENT-Hostile")
            print("--------------------------------------")
            print(" ")
            checkUpdateEmbed(5242880, "Burger Shot Update Checker", "LENT-Hostile is not up to date! Please update!\nCurent Version: " .. version .. " Latest Version: " .. text .. "\nhttps://github.com/Lanzaned-Enterprises/LENT-Hostile", "Script created by: https://discord.lanzaned.com")
        else -- resource is fine
            print(" ")
            print("---------- LANZANED HOSTILE ----------")
            print("LENT-Hostile is up to date and ready to go!")
            print("Running on Version: " .. version)
            print("https://github.com/Lanzaned-Enterprises/LENT-Hostile")
            print("--------------------------------------")
            print(" ")
            checkUpdateEmbed(20480, "Burger Shot Update Checker", "LENT-Hostile is up to date and ready to go!\nRunning on Version: " .. version .. "\nhttps://github.com/Lanzaned-Enterprises/LENT-Hostile", "Script created by: https://discord.lanzaned.com")
        end 
    end, "GET", "", {})
end