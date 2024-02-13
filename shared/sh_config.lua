Config = Config or {}
-- [[ DO NOT TOUCH THIS! ]] --

Config.ResourceOptions = {
    ['Difficulty'] = 'Easy', -- [[ Set peds to Easy, Normal or Hard ]] --
    ['LootSystem'] = true, -- [[ If true create target on dead peds and wait longer to remove them ]] --
    ['ResurrectTimer'] = 60000, -- [[ After a minute recreate the peds ]] --
}

Config.Framework = {
    ['Enabled'] = true, -- If this is false it disables all checks related to the options below
    ['Phone'] = 'qb', -- qb, gks, qs, yflip, npwd, custom
    ['Fuel'] = 'cdn-fuel', -- Set to resource-name aslong as the export is named "SetFuel"
    ['Notify'] = 'qb', -- qb, gta, ox, custom
    ['Inventory'] = 'ox' -- qb, lj, ps, ox
}

Config.Placement = {
    [1] = {
        ['Ped'] = 'g_m_m_cartelguards_01',
        ['Coords'] = vector4(212.78, -3329.45, 5.80, 335.08),
        ['Hostile'] = true,
        ['Weapon'] = true,
        ['Weapon_Hash'] = "WEAPON_CARBINERIFLE",
    }
}