-- Copyright (c) 2021 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.angels and reskins.angels.triggers.refining.items) then return end

-- Setup inputs and constants
local inputs = {
    mod = "angels",
    group = "refining",
    make_icon_pictures = false,
    flat_icon = true,
}

local shift = reskins.angels.constants.recipe_corner_shift
local scale = reskins.angels.constants.recipe_corner_scale

local intermediates = {
    ----------------------------------------------------------------------------------------------------
    -- Intermediates
    ----------------------------------------------------------------------------------------------------
    -- Miscellaneous
    ["solid-limestone"] = {subgroup = "intermediates"},
    ["slag"] = {subgroup = "intermediates"},
}

reskins.lib.create_icons_from_list(intermediates, inputs)

-- local composite_recipes = {}

-- for name, sources in pairs(composite_recipes) do
--     reskins.lib.composite_existing_icons(name, "recipe", sources)
-- end