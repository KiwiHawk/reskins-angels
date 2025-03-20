-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.angels and reskins.angels.triggers.smelting.items) then return end

---@type CreateIconsFromListInputs
local inputs = {
    mod = "angels",
    group = "smelting",
    make_icon_pictures = false,
    flat_icon = true,
}

local shift = reskins.angels.constants.recipe_corner_shift
local scale = reskins.angels.constants.recipe_corner_scale

-- Check to see if reskinning needs to be done.
if not mods["angelssmelting"] then
    -- Handle the few composite recipes that fall through the cracks

    -- A map of recipe names to the icon sources used to create a combined icon.
    -- The first entry in each IconSources is the first layer of the created icon.
    ---@type { [string]: IconSources }
    local recipe_icon_source_map = {
        -- Lead plates
        ["angelsore5-crushed-smelting"] = {
            { name = reskins.lib.prototypes.get_name_of_first_item_that_exists("bob-lead-plate", "angels-plate-lead"), type_name = "item" },
            { name = "angels-ore5-crushed", type_name = "item", scale = scale, shift = shift, -- Crushed rubyte
            },
        },

        -- Tin plates
        ["angelsore6-crushed-smelting"] = {
            { name = reskins.lib.prototypes.get_name_of_first_item_that_exists("tin-plate", "angels-plate-tin"), type_name = "item" },
            { name = "angels-ore6-crushed", type_name = "item", scale = scale, shift = shift, -- Crushed bobmonium
            },
        },
    }

    reskins.lib.icons.create_and_assign_combined_icons_from_sources_to_recipe(recipe_icon_source_map)

    return
end

---@type CreateIconsFromListTable
local intermediates = {
    ----------------------------------------------------------------------------------------------------
    -- Intermediates
    ----------------------------------------------------------------------------------------------------
    -- Vanilla Plates
    ["copper-plate"] = { icon_filename = "__base__/graphics/icons/copper-plate.png", icon_size = 64 },
    ["iron-plate"] = { subgroup = "plates", image = "angels-plate-iron" },
    ["steel-plate"] = { icon_filename = "__base__/graphics/icons/steel-plate.png", icon_size = 64 },

    -- Pure Angels Plates
    ["angels-plate-aluminium"] = { subgroup = "plates" },
    ["angels-plate-chrome"] = { subgroup = "plates" },
    ["angels-plate-cobalt"] = { subgroup = "plates" },
    ["angels-plate-glass"] = { mod = "lib", group = "shared", subgroup = "items", image = "glass" },
    ["angels-plate-gold"] = { mod = "lib", group = "shared", subgroup = "items", image = "gold-plate" },
    ["angels-plate-hot-iron"] = { subgroup = "plates" },
    ["angels-plate-iron"] = { subgroup = "plates" },
    ["angels-plate-lead"] = { subgroup = "plates" },
    ["angels-plate-manganese"] = { subgroup = "plates" },
    ["angels-plate-nickel"] = { subgroup = "plates" },
    ["angels-plate-platinum"] = { subgroup = "plates" },
    ["angels-plate-silver"] = { subgroup = "plates" },
    ["angels-plate-steel"] = { icon_filename = "__base__/graphics/icons/steel-plate.png", icon_size = 64 },
    ["angels-plate-tin"] = { subgroup = "plates" },
    ["angels-plate-titanium"] = { subgroup = "plates" },
    ["angels-plate-tungsten"] = { subgroup = "plates" },
    ["angels-plate-zinc"] = { subgroup = "plates" },

    -- Bob's Plates
    ["bob-aluminium-plate"] = { subgroup = "plates", image = "angels-plate-aluminium" },
    ["bronze-alloy"] = { subgroup = "plates" },
    ["brass-alloy"] = { subgroup = "plates" },
    ["cobalt-plate"] = { subgroup = "plates", image = "angels-plate-cobalt" },
    ["cobalt-steel-alloy"] = { subgroup = "plates" },
    ["bob-glass"] = { mod = "lib", group = "shared", subgroup = "items", image = "glass" },    -- Shared with Bobs
    ["bob-gold-plate"] = { mod = "lib", group = "shared", subgroup = "items", image="gold-plate" -- Shared with Bobs
    },
    ["gunmetal-alloy"] = { subgroup = "plates" },
    ["invar-alloy"] = { subgroup = "plates" },
    ["bob-lead-plate"] = { subgroup = "plates", image = "angels-plate-lead" },
    ["bob-nickel-plate"] = { subgroup = "plates", image = "angels-plate-nickel" },
    ["nitinol-alloy"] = { subgroup = "plates" },
    ["silver-plate"] = { subgroup = "plates", image = "angels-plate-silver" },
    ["tin-plate"] = { subgroup = "plates", image = "angels-plate-tin" },
    ["bob-titanium-plate"] = { subgroup = "plates", image = "angels-plate-titanium" },
    ["bob-tungsten-plate"] = { subgroup = "plates", image = "angels-plate-tungsten" },
    ["bob-zinc-plate"] = { subgroup = "plates", image = "angels-plate-zinc" },

    -- Pure Angels Wires
    ["angels-wire-gold"] = { mod = "lib", group = "shared", subgroup = "items", image = "gilded-copper-cable" },
    ["angels-wire-platinum"] = { subgroup = "intermediates" },
    ["angels-wire-silver"] = { subgroup = "intermediates" },
    ["angels-wire-tin"] = { subgroup = "intermediates" },

    -- Wires
    ["copper-cable"] = { icon_filename = "__base__/graphics/icons/copper-cable.png", icon_size = 64 },
    ["gilded-copper-cable"] = { mod = "lib", group = "shared", subgroup = "items" },
    ["tinned-copper-cable"] = { subgroup = "intermediates", image = "angels-wire-tin" },

    -- Miscellaneous
    ["solder"] = { mod = "lib", group = "shared", subgroup = "items" },
    ["angels-solder"] = { mod = "lib", group = "shared", subgroup = "items", image = "solder" },
    ["angels-silicon-wafer"] = { mod = "lib", group = "shared", subgroup = "items", image = "silicon-wafer" },
    ["solid-lime"] = { subgroup = "intermediates" },
    ["angels-quartz-crucible"] = { subgroup = "intermediates" },

    -- Sheet Coils from Angel's Extended Smelting and Compression
    ["angels-roll-bronze"] = { subgroup = "rolls" },
    ["angels-roll-invar"] = { subgroup = "rolls" },
    ["angels-roll-nitinol"] = { subgroup = "rolls" },
    ["angels-roll-cobalt-steel"] = { subgroup = "rolls" },
    ["angels-roll-brass"] = { subgroup = "rolls" },
    ["angels-roll-gunmetal"] = { subgroup = "rolls" },

    -- Rods
    ["iron-stick"] = { icon_filename = "__base__/graphics/icons/iron-stick.png", icon_size = 64, -- Put the icon back
    },
    -- ["angels-rod-steel"]

    ----------------------------------------------------------------------------------------------------
    -- Recipes
    ----------------------------------------------------------------------------------------------------
    -- Plates
    ["angels-plate-glass-1"] = { type = "recipe", mod = "lib", group = "shared", subgroup = "items", image = "glass", icon_extras = reskins.angels.num_tier(1, inputs.group) },
    ["angels-plate-glass-2"] = { type = "recipe", mod = "lib", group = "shared", subgroup = "items", image = "glass", icon_extras = reskins.angels.num_tier(2, inputs.group) },
    ["angels-plate-glass-3"] = { type = "recipe", mod = "lib", group = "shared", subgroup = "items", image = "glass", icon_extras = reskins.angels.num_tier(3, inputs.group) },


    -- Angel's Extended Smelting and Compression Sheet Coils
    ["angels-roll-brass-casting"] = { type = "recipe", subgroup = "rolls", image = "angels-roll-brass", icon_extras = reskins.angels.num_tier(1, inputs.group) },
    ["angels-roll-brass-casting-fast"] = { type = "recipe", subgroup = "rolls", image = "angels-roll-brass", icon_extras = reskins.angels.num_tier(2, inputs.group) },

    ["angels-roll-bronze-casting"] = { type = "recipe", subgroup = "rolls", image = "angels-roll-bronze", icon_extras = reskins.angels.num_tier(1, inputs.group) },
    ["angels-roll-bronze-casting-fast"] = { type = "recipe", subgroup = "rolls", image = "angels-roll-bronze", icon_extras = reskins.angels.num_tier(2, inputs.group) },

    ["angels-roll-cobalt-steel-casting"] = { type = "recipe", subgroup = "rolls", image = "angels-roll-cobalt-steel", icon_extras = reskins.angels.num_tier(1, inputs.group) },
    ["angels-roll-cobalt-steel-casting-fast"] = { type = "recipe", subgroup = "rolls", image = "angels-roll-cobalt-steel", icon_extras = reskins.angels.num_tier(2, inputs.group) },

    ["angels-roll-gunmetal-casting"] = { type = "recipe", subgroup = "rolls", image = "angels-roll-gunmetal", icon_extras = reskins.angels.num_tier(1, inputs.group) },
    ["angels-roll-gunmetal-casting-fast"] = { type = "recipe", subgroup = "rolls", image = "angels-roll-gunmetal", icon_extras = reskins.angels.num_tier(2, inputs.group) },

    ["angels-roll-invar-casting"] = { type = "recipe", subgroup = "rolls", image = "angels-roll-invar", icon_extras = reskins.angels.num_tier(1, inputs.group) },
    ["angels-roll-invar-casting-fast"] = { type = "recipe", subgroup = "rolls", image = "angels-roll-invar", icon_extras = reskins.angels.num_tier(2, inputs.group) },

    ["angels-roll-nitinol-casting"] = { type = "recipe", subgroup = "rolls", image = "angels-roll-nitinol", icon_extras = reskins.angels.num_tier(1, inputs.group) },
    ["angels-roll-nitinol-casting-fast"] = { type = "recipe", subgroup = "rolls", image = "angels-roll-nitinol", icon_extras = reskins.angels.num_tier(2, inputs.group) },

    ["angels-roll-tungsten-casting"] = { type = "recipe", subgroup = "rolls", image = "angels-roll-tungsten", icon_extras = reskins.angels.num_tier(1, inputs.group) },
    ["angels-roll-tungsten-casting-fast"] = { type = "recipe", subgroup = "rolls", image = "angels-roll-tungsten", icon_extras = reskins.angels.num_tier(2, inputs.group) },
}

if mods["reskins-bobs"] then
    intermediates["tungsten-carbide"] = { type = "recipe", mod = "bobs", group = "plates", subgroup = "plates", image = "tungsten-carbide", icon_extras = reskins.angels.num_tier(1, inputs.group) }   -- "1"
    intermediates["tungsten-carbide-2"] = { type = "recipe", mod = "bobs", group = "plates", subgroup = "plates", image = "tungsten-carbide", icon_extras = reskins.angels.num_tier(2, inputs.group) } -- "2"
end

-- Check if we're using Angel's material colors
if reskins.lib.settings.get_value("reskins-angels-use-angels-material-colors") then
    -- Gears
    intermediates["cobalt-steel-gear-wheel"] = { subgroup = "gears" }
    intermediates["nitinol-gear-wheel"] = { subgroup = "gears" }
    intermediates["titanium-gear-wheel"] = { subgroup = "gears" }
    intermediates["tungsten-gear-wheel"] = { subgroup = "gears" }

    -- Bearing Balls
    intermediates["ceramic-bearing-ball"] = { subgroup = "bearing-balls" }
    intermediates["cobalt-steel-bearing-ball"] = { subgroup = "bearing-balls" }
    intermediates["nitinol-bearing-ball"] = { subgroup = "bearing-balls" }
    intermediates["titanium-bearing-ball"] = { subgroup = "bearing-balls" }

    -- Bearings
    intermediates["ceramic-bearing"] = { subgroup = "bearings" }
    intermediates["cobalt-steel-bearing"] = { subgroup = "bearings" }
    intermediates["nitinol-bearing"] = { subgroup = "bearings" }
    intermediates["titanium-bearing"] = { subgroup = "bearings" }

    -- Bob Warefare Armor
    intermediates["heavy-armor-3"] = { type = "armor", subgroup = "armor" }
    intermediates["bob-power-armor-mk4"] = { type = "armor", subgroup = "armor" }
    intermediates["bob-power-armor-mk5"] = { type = "armor", subgroup = "armor" }
end

reskins.internal.create_icons_from_list(intermediates, inputs)


-- A map of recipe names to the icon sources used to create a combined icon.
-- The first entry in each IconSources is the first layer of the created icon.
---@type { [string]: IconSources }
local recipe_icon_source_map = {
    ----------------------------------------------------------------------------------------------------
    -- PLATES
    ----------------------------------------------------------------------------------------------------
    -- Aluminium
    ["angels-plate-aluminium"] = {
        { name = reskins.lib.prototypes.get_name_of_first_item_that_exists("bob-aluminium-plate", "angels-plate-aluminium"), type_name = "item" },
        { name = "liquid-molten-aluminium", type_name = "fluid", scale = scale, shift = shift }, -- Molten aluminium
    },
    ["angels-roll-aluminium-converting"] = {
        { name = reskins.lib.prototypes.get_name_of_first_item_that_exists("bob-aluminium-plate", "angels-plate-aluminium"), type_name = "item" },
        { name = "angels-roll-aluminium", type_name = "item", scale = scale, shift = shift }, -- Aluminium sheet coil
    },

    -- Chrome
    ["angels-plate-chrome"] = {
        { name = "angels-plate-chrome", type_name = "item" },
        { name = "liquid-molten-chrome", type_name = "fluid", scale = scale, shift = shift }, -- Molten chrome
    },
    ["angels-roll-chrome-converting"] = {
        { name = "angels-plate-chrome", type_name = "item" },
        { name = "angels-roll-chrome", type_name = "item", scale = scale, shift = shift }, -- Chrome sheet coil
    },

    -- Cobalt
    ["angels-plate-cobalt"] = {
        { name = reskins.lib.prototypes.get_name_of_first_item_that_exists("cobalt-plate", "angels-plate-cobalt"), type_name = "item" },
        { name = "liquid-molten-cobalt", type_name = "fluid", scale = scale, shift = shift }, -- Molten cobalt
    },
    ["angels-roll-cobalt-converting"] = {
        { name = reskins.lib.prototypes.get_name_of_first_item_that_exists("cobalt-plate", "angels-plate-cobalt"), type_name = "item" },
        { name = "angels-roll-cobalt", type_name = "item", scale = scale, shift = shift }, -- Cobalt sheet coil
    },

    -- Copper
    ["angelsore3-crushed-smelting"] = {
        { name = "copper-plate", type_name = "item" },
        { name = "angels-ore3-crushed", type_name = "item", scale = scale, shift = shift }, -- Crushed stiratite
    },
    ["copper-plate"] = {
        { name = "copper-plate", type_name = "item" },
        { name = "copper-ore", type_name = "item", scale = scale, shift = shift }, -- Copper ore
    },
    ["angels-plate-copper"] = {
        { name = "copper-plate", type_name = "item" },
        { name = "liquid-molten-copper", type_name = "fluid", scale = scale, shift = shift }, -- Molten copper
    },
    ["angels-roll-copper-converting"] = {
        { name = "copper-plate", type_name = "item" },
        { name = "angels-roll-copper", type_name = "item", scale = scale, shift = shift }, -- Copper sheet coil
    },
    ["angels-copper-pebbles-smelting"] = {
        { name = "copper-plate", type_name = "item" },
        { name = "angels-copper-pebbles", type_name = "item", scale = scale, shift = shift }, -- Copper pebbles
    },
    ["angels-copper-nugget-smelting"] = {
        { name = "copper-plate", type_name = "item" },
        { name = "angels-copper-nugget", type_name = "item", scale = scale, shift = shift }, -- Copper nuggets
    },

    -- Glass
    ["quartz-glass"] = {
        { name = "glass", type_name = "item" },
        { name = "quartz", type_name = "item", scale = scale, shift = shift }, -- Silicon ore
    },

    -- Gold
    ["angels-plate-gold"] = {
        { name = reskins.lib.prototypes.get_name_of_first_item_that_exists("bob-gold-plate", "angels-plate-gold"), type_name = "item" },
        { name = "liquid-molten-gold", type_name = "fluid", scale = scale, shift = shift }, -- Molten gold
    },
    ["angels-roll-gold-converting"] = {
        { name = reskins.lib.prototypes.get_name_of_first_item_that_exists("bob-gold-plate", "angels-plate-gold"), type_name = "item" },
        { name = "angels-roll-gold", type_name = "item", scale = scale, shift = shift }, -- Gold sheet coil
    },

    -- Invar
    ["angels-plate-invar"] = {
        { name = "invar-alloy", type_name = "item" },
        { name = "liquid-molten-invar", type_name = "fluid", scale = scale, shift = shift }, -- Molten invar
    },
    ["invar-alloy"] = {
        { name = "invar-alloy", type_name = "item" },
        { name = reskins.lib.prototypes.get_name_of_first_item_that_exists("bob-nickel-plate", "angels-plate-nickel"), type_name = "item", scale = scale, shift = { -6, -10 } },
        { name = "iron-plate", type_name = "item", scale = scale, shift = shift }, -- Nickel/Iron plates
    },

    -- Iron
    ["angelsore1-crushed-smelting"] = {
        { name = "iron-plate", type_name = "item" },
        { name = "angels-ore1-crushed", type_name = "item", scale = scale, shift = shift }, -- Crushed saphirite
    },
    ["iron-plate"] = {
        { name = "iron-plate", type_name = "item" },
        { name = "iron-ore", type_name = "item", scale = scale, shift = shift }, -- Iron ore
    },
    ["angels-plate-iron"] = {
        { name = "iron-plate", type_name = "item" },
        { name = "liquid-molten-iron", type_name = "fluid", scale = scale, shift = shift }, -- Molten iron
    },
    ["angels-roll-iron-converting"] = {
        { name = "iron-plate", type_name = "item" },
        { name = "angels-roll-iron", type_name = "item", scale = scale, shift = shift }, -- Iron sheet coil
    },
    ["angels-iron-pebbles-smelting"] = {
        { name = "iron-plate", type_name = "item" },
        { name = "angels-iron-pebbles", type_name = "item", scale = scale, shift = shift }, -- Iron pebbles
    },
    ["angels-iron-nugget-smelting"] = {
        { name = "iron-plate", type_name = "item" },
        { name = "angels-iron-nugget", type_name = "item", scale = scale, shift = shift }, -- Iron nuggets
    },

    -- Lead
    ["bob-lead-plate"] = {
        { name = reskins.lib.prototypes.get_name_of_first_item_that_exists("bob-lead-plate", "angels-plate-lead"), type_name = "item" },
        { name = "lead-ore", type_name = "item", scale = scale, shift = shift }, -- Lead ore
    },
    ["angels-plate-lead"] = {
        { name = reskins.lib.prototypes.get_name_of_first_item_that_exists("bob-lead-plate", "angels-plate-lead"), type_name = "item" },
        { name = "liquid-molten-lead", type_name = "fluid", scale = scale, shift = shift }, -- Molten lead
    },
    ["angels-roll-lead-converting"] = {
        { name = reskins.lib.prototypes.get_name_of_first_item_that_exists("bob-lead-plate", "angels-plate-lead"), type_name = "item" },
        { name = "angels-roll-lead", type_name = "item", scale = scale, shift = shift }, -- Lead sheet coil
    },
    ["silver-from-lead"] = {
        { name = reskins.lib.prototypes.get_name_of_first_item_that_exists("bob-lead-plate", "angels-plate-lead"), type_name = "item" },
        { name = "silver-ore", type_name = "item", scale = scale, shift = shift },
    },

    -- Manganese
    ["angels-plate-manganese"] = {
        { name = "angels-plate-manganese", type_name = "item" },
        { name = "liquid-molten-manganese", type_name = "fluid", scale = scale, shift = shift }, -- Molten manganese
    },
    ["angels-roll-manganese-converting"] = {
        { name = "angels-plate-manganese", type_name = "item" },
        { name = "angels-roll-manganese", type_name = "item", scale = scale, shift = shift }, -- Manganese sheet coil
    },

    -- Nickel
    ["angels-plate-nickel"] = {
        { name = reskins.lib.prototypes.get_name_of_first_item_that_exists("bob-nickel-plate", "angels-plate-nickel"), type_name = "item" },
        { name = "liquid-molten-nickel", type_name = "fluid", scale = scale, shift = shift }, -- Molten nickel
    },
    ["angels-roll-nickel-converting"] = {
        { name = reskins.lib.prototypes.get_name_of_first_item_that_exists("bob-nickel-plate", "angels-plate-nickel"), type_name = "item" },
        { name = "angels-roll-nickel", type_name = "item", scale = scale, shift = shift }, -- Nickel sheet roll
    },

    -- Nitinol
    ["angels-plate-nitinol"] = {
        { name = "nitinol-alloy", type_name = "item" },
        { name = "liquid-molten-nitinol", type_name = "fluid", scale = scale, shift = shift }, -- Molten nitinol
    },

    -- Platinum
    ["angels-plate-platinum"] = {
        { name = "angels-plate-platinum", type_name = "item" },
        { name = "liquid-molten-platinum", type_name = "fluid", scale = scale, shift = shift }, -- Molten platinum
    },
    ["angels-roll-platinum-converting"] = {
        { name = "angels-plate-platinum", type_name = "item" },
        { name = "angels-roll-platinum", type_name = "item", scale = scale, shift = shift }, -- Platinum sheet coil
    },

    -- Silver
    ["silver-plate"] = {
        { name = reskins.lib.prototypes.get_name_of_first_item_that_exists("silver-plate", "angels-plate-silver"), type_name = "item" },
        { name = "silver-ore", type_name = "item", scale = scale, shift = shift }, -- Silver ore
    },
    ["angels-plate-silver"] = {
        { name = reskins.lib.prototypes.get_name_of_first_item_that_exists("silver-plate", "angels-plate-silver"), type_name = "item" },
        { name = "liquid-molten-silver", type_name = "fluid", scale = scale, shift = shift }, -- Molten silver
    },
    ["angels-roll-silver-converting"] = {
        { name = reskins.lib.prototypes.get_name_of_first_item_that_exists("silver-plate", "angels-plate-silver"), type_name = "item" },
        { name = "angels-roll-silver", type_name = "item", scale = scale, shift = shift }, -- Silver sheet coil
    },

    -- Steel plate
    ["steel-plate"] = {
        { name = "angels-plate-hot-iron", type_name = "item" },
        { name = "iron-plate", type_name = "item", scale = scale, shift = shift }, -- Hot-Iron plate
    },
    ["angels-plate-steel-pre-heating"] = {
        { name = "steel-plate", type_name = "item" },
        { name = "angels-plate-hot-iron", type_name = "item", scale = scale, shift = shift },
    },
    ["angels-plate-steel"] = {
        { name = "steel-plate", type_name = "item" },
        { name = "liquid-molten-steel", type_name = "fluid", scale = scale, shift = shift }, -- Molten steel
    },
    ["angels-roll-steel-converting"] = {
        { name = "steel-plate", type_name = "item" },
        { name = "angels-roll-steel", type_name = "item", scale = scale, shift = shift }, -- Steel sheet coil
    },

    -- Tin
    ["tin-plate"] = {
        { name = reskins.lib.prototypes.get_name_of_first_item_that_exists("tin-plate", "angels-plate-tin"), type_name = "item" },
        { name = "tin-ore", type_name = "item", scale = scale, shift = shift }, -- Tin ore
    },
    ["angels-plate-tin"] = {
        { name = reskins.lib.prototypes.get_name_of_first_item_that_exists("tin-plate", "angels-plate-tin"), type_name = "item" },
        { name = "liquid-molten-tin", type_name = "fluid", scale = scale, shift = shift }, -- Molten tin
    },
    ["angels-roll-tin-converting"] = {
        { name = reskins.lib.prototypes.get_name_of_first_item_that_exists("tin-plate", "angels-plate-tin"), type_name = "item" },
        { name = "angels-roll-tin", type_name = "item", scale = scale, shift = shift }, -- Tin sheet coil
    },

    -- Titanium
    ["angels-plate-titanium"] = {
        { name = reskins.lib.prototypes.get_name_of_first_item_that_exists("bob-titanium-plate", "angels-plate-titanium"), type_name = "item" },
        { name = "liquid-molten-titanium", type_name = "fluid", scale = scale, shift = shift }, -- Molten titanium
    },
    ["angels-roll-titanium-converting"] = {
        { name = reskins.lib.prototypes.get_name_of_first_item_that_exists("bob-titanium-plate", "angels-plate-titanium"), type_name = "item" },
        { name = "angels-roll-titanium", type_name = "item", scale = scale, shift = shift }, -- Titanium sheet coil
    },

    -- Zinc
    ["angels-plate-zinc"] = {
        { name = reskins.lib.prototypes.get_name_of_first_item_that_exists("bob-zinc-plate", "angels-plate-zinc"), type_name = "item" },
        { name = "liquid-molten-zinc", type_name = "fluid", scale = scale, shift = shift }, -- Molten Zinc
    },
    ["angels-roll-zinc-converting"] = {
        { name = reskins.lib.prototypes.get_name_of_first_item_that_exists("bob-zinc-plate", "angels-plate-zinc"), type_name = "item" },
        { name = "angels-roll-zinc", type_name = "item", scale = scale, shift = shift }, -- Zinc sheet coil
    },

    ----------------------------------------------------------------------------------------------------
    -- Intermediates
    ----------------------------------------------------------------------------------------------------
    -- Copper cable
    ["copper-cable"] = {
        { name = "copper-cable", type_name = "item" },
        { name = "copper-plate", type_name = "item", scale = scale, shift = shift }, -- Copper plate
    },
    ["angels-wire-coil-copper-converting"] = {
        { name = "copper-cable", type_name = "item" },
        { name = "angels-wire-coil-copper", type_name = "item", scale = scale, shift = shift }, -- Copper wire coil
    },

    -- Gold cable
    ["angels-wire-gold"] = {
        { name = reskins.lib.prototypes.get_name_of_first_item_that_exists("gilded-copper-cable", "angels-wire-gold"), type_name = "item" },
        { name = reskins.lib.prototypes.get_name_of_first_item_that_exists("bob-gold-plate", "angels-plate-gold"), type_name = "item", scale = scale, shift = shift }, -- Gold plate
    },
    ["angels-wire-coil-gold-converting"] = {
        { name = reskins.lib.prototypes.get_name_of_first_item_that_exists("gilded-copper-cable", "angels-wire-gold"), type_name = "item" },
        { name = "angels-wire-coil-gold", type_name = "item", scale = scale, shift = shift }, -- Gold wire coil
    },

    -- Silver cable
    ["basic-silvered-copper-wire"] = {
        { name = "angels-wire-silver", type_name = "item" },
        { name = reskins.lib.prototypes.get_name_of_first_item_that_exists("silver-plate", "angels-plate-silver"), type_name = "item", scale = scale, shift = shift }, -- Silver plate
    },
    ["angels-wire-coil-silver-converting"] = {
        { name = "angels-wire-silver", type_name = "item" },
        { name = "angels-wire-coil-silver", type_name = "item", scale = scale, shift = shift }, -- Silver wire coil
    },

    -- Platinum cable
    ["basic-platinated-copper-wire"] = {
        { name = "angels-wire-platinum", type_name = "item" },
        { name = "angels-plate-platinum", type_name = "item", scale = scale, shift = shift }, -- Platinum plate
    },
    ["angels-wire-coil-platinum-converting"] = {
        { name = "angels-wire-platinum", type_name = "item" },
        { name = "angels-wire-coil-platinum", type_name = "item", scale = scale, shift = shift }, -- Platinum wire coil
    },

    -- Tin cable
    ["basic-tinned-copper-wire"] = {
        { name = reskins.lib.prototypes.get_name_of_first_item_that_exists("tinned-copper-cable", "angels-wire-tin"), type_name = "item" },
        { name = reskins.lib.prototypes.get_name_of_first_item_that_exists("tin-plate", "angels-plate-tin"), type_name = "item", scale = scale, shift = shift }, -- Tin plate
    },
    ["angels-wire-coil-tin-converting"] = {
        { name = reskins.lib.prototypes.get_name_of_first_item_that_exists("tinned-copper-cable", "angels-wire-tin"), type_name = "item" },
        { name = "angels-wire-coil-tin", type_name = "item", scale = scale, shift = shift }, -- Tin wire coil
    },

    -- Insulated cable (Angel's Extended Smelting and Compression)
    ["angels-wire-coil-insulated-converting"] = {
        { name = "insulated-cable", type_name = "item" },
        { name = "angels-wire-coil-insulated", type_name = "item", shift = shift, scale = scale },
    },

    -- Solder
    ["angels-solder-mixture-smelting"] = {
        { name = reskins.lib.prototypes.get_name_of_first_item_that_exists("solder", "angels-solder"), type_name = "item" },
        { name = "angels-solder-mixture", type_name = "item", scale = scale, shift = shift },
    },
    ["angels-solder"] = {
        { name = reskins.lib.prototypes.get_name_of_first_item_that_exists("solder", "angels-solder"), type_name = "item" },
        { name = "liquid-molten-solder", type_name = "fluid", scale = scale, shift = shift },
    },
    ["angels-roll-solder-converting"] = {
        { name = reskins.lib.prototypes.get_name_of_first_item_that_exists("solder", "angels-solder"), type_name = "item" },
        { name = "angels-roll-solder", type_name = "item", scale = scale, shift = shift },
    },

    -- Rods
    ["angels-rod-iron-plate"] = {
        { name = "iron-stick", type_name = "item" },
        { name = "iron-plate", type_name = "item", scale = scale, shift = shift },
    },
    ["angels-rod-stack-iron-converting"] = {
        { name = "iron-stick", type_name = "item" },
        { name = "angels-rod-stack-iron", type_name = "item", scale = scale, shift = shift },
    },
    ["angels-rod-steel-plate"] = {
        { name = "angels-rod-steel", type_name = "item" },
        { name = "steel-plate", type_name = "item", scale = scale, shift = shift },
    },
    -- ["angels-rod-stack-steel-converting"] = {
    --     { name = "angels-rod-steel", type_name = "item" },
    --     { name = "angels-rod-stack-steel", type_name = "item", scale = scale, shift = shift },
    -- },
}

reskins.lib.icons.create_and_assign_combined_icons_from_sources_to_recipe(recipe_icon_source_map)

-- Make variations for ingots
if reskins.lib.settings.get_value("reskins-angels-use-item-variations") then
    local ingot_variations = {
        "aluminium",
        "chrome",
        "cobalt",
        "copper",
        "gold",
        "iron",
        "steel",
        "lead",
        "manganese",
        "nickel",
        "platinum",
        "silicon",
        "silver",
        "tin",
        "titanium",
        "zinc",
    }

    for _, ingot in pairs(ingot_variations) do
        local item = data.raw.item["ingot-" .. ingot]
        if not item then goto continue end

        -- Setup initial pictures table with primary icon
        item.pictures = {
            {
                filename = "__reskins-angels__/graphics/icons/smelting/ingots/" .. ingot .. "/ingot-" .. ingot .. ".png",
                size = 64,
                mipmap_count = 4,
                scale = 0.25,
            },
        }

        for i = 1, 8, 1 do
            table.insert(item.pictures, {
                filename = "__reskins-angels__/graphics/icons/smelting/ingots/" .. ingot .. "/ingot-" .. ingot .. "-" .. i .. ".png",
                size = 64,
                mipmap_count = 4,
                scale = 0.25,
            })
        end

        ::continue::
    end
end

-- Make variations for powders
local powder_variations = {
    ["powder-aluminium"] = "aluminium",
    ["casting-powder-tungsten"] = "tungsten-mixture",
    ["powder-chrome"] = "chrome",
    ["powder-cobalt"] = "cobalt",
    ["powder-copper"] = "copper",
    ["powder-gold"] = "gold",
    ["powder-iron"] = "iron",
    ["powder-steel"] = "steel",
    ["powder-lead"] = "lead",
    ["powder-manganese"] = "manganese",
    ["powder-nickel"] = "nickel",
    ["powder-platinum"] = "platinum",
    ["silicon-powder"] = "silicon",
    ["powder-silver"] = "silver",
    ["powder-tin"] = "tin",
    ["powder-titanium"] = "titanium",
    ["powdered-tungsten"] = "tungsten",
    ["powder-zinc"] = "zinc",
}

for powder, material in pairs(powder_variations) do
    -- Create the variations.
    ---@type data.Sprite[]
    local sprite_variations = {}

    for i = 1, 6, 1 do
        ---@type data.Sprite
        local sprite_variation = {
            filename = "__reskins-angels__/graphics/icons/smelting/powders/" .. material .. "/powder-" .. material .. "-" .. i .. ".png",
            size = 64,
            mipmap_count = 4,
            scale = 0.25,
        }

        table.insert(sprite_variations, sprite_variation)
    end

    -- Ensure that the item icon uses the same as the variations.
    ---@type DeferrableIconData
    local deferrable_icon = {
        icon_data = { {
            icon = "__reskins-angels__/graphics/icons/smelting/powders/" .. material .. "/powder-" .. material .. ".png",
            icon_size = 64,
            scale = 0.5,
        } },
        pictures = sprite_variations,
        name = powder,
        type_name = "item",
    }

    reskins.lib.icons.assign_deferrable_icon(deferrable_icon)
end

-- Clear recipe icons
local recipes = {
    "aluminium-processed-processing",
    "zinc-processed-processing",
    "bauxite-ore-processing",
    "zinc-ore-processing",
}

for _, name in pairs(recipes) do
    local recipe = data.raw.recipe[name]
    if not recipe then goto continue end

    recipe.icon = nil
    recipe.icons = nil

    ::continue::
end
