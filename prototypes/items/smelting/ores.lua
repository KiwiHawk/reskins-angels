-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["angelssmelting"] then return end

local inputs = {
    directory = reskins.angels.directory,
    mod = "angels",
}

reskins.lib.parse_inputs(inputs)

local ores = {
    "thorium-ore",
    -- "tin-ore", (green)
    "sulfer",
}

for _, name in pairs(ores) do
    -- Fetch entity
    local item = data.raw.item[name]

    -- Check if item exists, if not, skip this iteration
    if not item then goto continue end

    -- Setup icons
    if name == "sulfur" then
        inputs.icon = "__base__/graphics/icons/sulfur.png"
        inputs.icon_picture = nil
    else
        inputs.icon = reskins.angels.directory.."/graphics/icons/smelting/ores/"..name.."/"..name..".png"
        inputs.icon_picture = {
            { size = 64, filename = reskins.angels.directory.."/graphics/icons/smelting/ores/"..name.."/"..name..".png",   scale = 0.25, mipmap_count = 4 },
            { size = 64, filename = reskins.angels.directory.."/graphics/icons/smelting/ores/"..name.."/"..name.."-1.png", scale = 0.25, mipmap_count = 4 },
            { size = 64, filename = reskins.angels.directory.."/graphics/icons/smelting/ores/"..name.."/"..name.."-2.png", scale = 0.25, mipmap_count = 4 },
            { size = 64, filename = reskins.angels.directory.."/graphics/icons/smelting/ores/"..name.."/"..name.."-3.png", scale = 0.25, mipmap_count = 4 }
        }
    end

    reskins.lib.assign_icons(name, inputs)

    -- Label to skip to next iteration
    ::continue::
end