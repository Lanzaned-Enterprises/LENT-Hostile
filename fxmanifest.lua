--[[ Metadata ]]--
fx_version 'cerulean'
games { 'gta5' }

-- [[ Author ]] --
author 'Izumi S. <https://discordapp.com/users/871877975346405388>'
description 'Lananed Development | '
discord 'https://discord.lanzaned.com'
github 'https://github.com/Lanzaned-Enterprises/'
docs 'https://docs.lanzaned.com/'

-- [[ Version ]] --
version '1.0.0'

-- [[ Files ]] --
shared_scripts {
    'shared/*.lua',
}

client_scripts {
    -- Polyzone Dependency
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/ComboZone.lua',
    -- [[ Client Events ]] --
    'client/*.lua',
}

server_scripts {
    'server/*.lua',
}

-- [[ Tebex ]] --
lua54 'yes'