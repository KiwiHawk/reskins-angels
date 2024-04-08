-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.angels and reskins.angels.triggers.refining.entities) then return end

-- Set input parameters
local inputs = {
    type = "assembling-machine",
    icon_name = "filtration-unit",
    base_entity_name = "assembling-machine-1",
    mod = "angels",
    particles = {["big"] = 1, ["medium"] = 2},
    group = "refining",
    make_remnants = false,
}

local tier_map = {
    ["filtration-unit"] = {tier = 1, prog_tier = 2},
    ["filtration-unit-2"] = {tier = 2, prog_tier = 3},
    ["filtration-unit-3"] = {tier = 3, prog_tier = 4},

    -- Extended Angels
    ["filtration-unit-4"] = {tier = 4, prog_tier = 5},
}

-- Sea Block compatibility
if mods["SeaBlock"] then
    tier_map["filtration-unit"].prog_tier = 1
end

-- Reskin entities, create and assign extra details
for name, map in pairs(tier_map) do
    -- Fetch entity
    local entity = data.raw[inputs.type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then goto continue end

    -- Handle tier
    local tier = map.tier
    if reskins.lib.settings.get_value("reskins-lib-tier-mapping") == "progression-map" then
        tier = map.prog_tier or map.tier
    end

    -- Determine what tint we're using
    inputs.tint = map.tint or reskins.lib.tiers.get_tint(tier)

    reskins.lib.setup_standard_entity(name, tier, inputs)

    -- Reskin entities
    entity.animation = {
        layers = {
            -- Base
            {
                filename = "__angelsrefining__/graphics/entity/filtration-unit/filtration-unit.png",
                priority = "extra-high",
                width = 224,
                height = 224,
                shift = {0, -0.2},
            },
            -- Mask
            {
                filename = "__reskins-angels__/graphics/entity/refining/filtration-unit/filtration-unit-mask.png",
                priority = "extra-high",
                width = 224,
                height = 224,
                shift = {0, -0.2},
                tint = inputs.tint,
            },
            -- Highlights
            {
                filename = "__reskins-angels__/graphics/entity/refining/filtration-unit/filtration-unit-highlights.png",
                priority = "extra-high",
                width = 224,
                height = 224,
                shift = {0, -0.2},
                blend_mode = reskins.lib.settings.blend_mode,
            },
        }
    }

    -- Label to skip to next iteration
    ::continue::
end