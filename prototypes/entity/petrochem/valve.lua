-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.angels and reskins.angels.triggers.petrochem.entities) then
	return
end

-- Set input parameters
local inputs = {
	type = "storage-tank",
	icon_name = "valve",
	base_entity_name = "pipe",
	mod = "angels",
	group = "petrochem",
	particles = { ["small"] = 2 },
	icon_layers = 2,
	make_remnants = false,
}

local valves = {
	["valve-inspector"] = { tint = util.color("#8dd24e") },
	["valve-overflow"] = { tint = util.color("#689ed3") },
	["valve-return"] = { tint = util.color("#d4933f") },
	["valve-underflow"] = { tint = util.color("#fcfcfc") },
}

local function cardinal_pictures(x, tint)
	local x_lr = 64 * x
	local x_hr = 128 * x

	return {
		layers = {
			-- Base
			{
				filename = "__reskins-angels__/graphics/entity/petrochem/valve/valve-base.png",
				priority = "extra-high",
				x = x_hr,
				width = 128,
				height = 128,
				scale = 0.5,
			},
			-- Mask
			{
				filename = "__reskins-angels__/graphics/entity/petrochem/valve/valve-mask.png",
				priority = "extra-high",
				x = x_hr,
				width = 128,
				height = 128,
				tint = tint,
				scale = 0.5,
			},
		},
	}
end

for name, map in pairs(valves) do
	---@type data.FurnacePrototype|data.StorageTankPrototype
	local entity = data.raw[inputs.type][name]
	if not entity then
		goto continue
	end

	-- Assign tint
	inputs.tint = map.tint

	reskins.lib.setup_standard_entity(name, 0, inputs)

	-- Reskin entities
	entity.pictures.picture.north = cardinal_pictures(0, inputs.tint)
	entity.pictures.picture.east = cardinal_pictures(1, inputs.tint)
	entity.pictures.picture.south = cardinal_pictures(2, inputs.tint)
	entity.pictures.picture.west = cardinal_pictures(3, inputs.tint)

	-- Add pipe overs
	entity.fluid_box.pipe_covers = pipecoverspictures()

	::continue::
end

-- Setup for one-off converter valve
local name = "valve-converter"
inputs.type = "furnace"
inputs.tint = util.color("#fdec2b")

---@type data.FurnacePrototype
local entity = data.raw[inputs.type][name]
if not entity then
	return
end

reskins.lib.setup_standard_entity(name, 0, inputs)

entity.graphics_set.animation = reskins.lib.sprites.make_4way_animation_from_spritesheet({
	layers = {
		-- Base
		{
			filename = "__reskins-angels__/graphics/entity/petrochem/valve/valve-base.png",
			priority = "extra-high",
			width = 128,
			height = 128,
			scale = 0.5,
		},
		-- Mask
		{
			filename = "__reskins-angels__/graphics/entity/petrochem/valve/valve-mask.png",
			priority = "extra-high",
			width = 128,
			height = 128,
			tint = inputs.tint,
			scale = 0.5,
		},
	},
})
