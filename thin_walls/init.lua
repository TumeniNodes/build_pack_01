-- [Mod]Thin Walls [thin_walls] (Ver. 0.1) for Minetest Game
-- MIT Copyright (c) 2015-2026 TumeniNodes

thin_walls = {}

function thin_walls.register_walls(modname, subname, desc, tiles, sounds)
	if not minetest.get_modpath(modname) then return end

	local recipeitem = modname .. ":" .. subname
	local node_def = minetest.registered_nodes[recipeitem]

	local node_groups = {thin_wall = 1, creative = 1}
	if node_def and node_def.groups then
		for k, v in pairs(node_def.groups) do
			node_groups[k] = v
		end
	else
		if subname:find("wood") or subname:find("jungle") then
			node_groups.choppy = 2
			node_groups.flammable = 3
		else
			node_groups.cracky = 3
			node_groups.stone = 1
		end
	end

	local final_sounds = sounds or (node_def and node_def.sounds)
	if not final_sounds and minetest.get_modpath("default") then
		if node_groups.choppy then
			final_sounds = default.node_sound_wood_defaults()
		else
			final_sounds = default.node_sound_stone_defaults()
		end
	end

	-- THIN WALL
	minetest.register_node("thin_walls:thin_wall_" .. subname, {
		description = desc .. " Thin Wall",
		drawtype = "nodebox",
		tiles = tiles,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = node_groups,
		is_ground_content = false,
		sounds = final_sounds,
		node_box = { type = "fixed",
		fixed = {
				{-0.5, -0.5, -0.1875, 0.5, 0.5, 0.1875}
			}
		}
	})

	-- TWO WAY THIN WALL
	minetest.register_node("thin_walls:thin_wall_two_way_" .. subname, {
		description = desc .. " Thin Wall (Two Way)",
		drawtype = "nodebox",
		tiles = tiles,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = node_groups,
		is_ground_content = false,
		sounds = final_sounds,
		node_box = { type = "fixed",
		fixed = {
				{-0.5, -0.5, -0.1875, 0.1875, 0.5, 0.1875},
				{-0.1875, -0.5, -0.5, 0.1875, 0.5, 0.1875},
			}
		}
	})

	-- THREE WAY THIN WALL
	minetest.register_node("thin_walls:thin_wall_three_way_" .. subname, {
		description = desc .. " Thin Wall (Three Way)",
		drawtype = "nodebox",
		tiles = tiles,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = node_groups,
		is_ground_content = false,
		sounds = final_sounds,
		node_box = { type = "fixed",
		fixed = {
				{-0.5, -0.5, -0.1875, 0.5, 0.5, 0.1875},
				{-0.1875, -0.5, -0.5, 0.1875, 0.5, 0.1875},
			}
		}
	})

	-- FOUR WAY THIN WALL
	minetest.register_node("thin_walls:thin_wall_four_way_" .. subname, {
		description = desc .. " Thin Wall (Four Way)",
		drawtype = "nodebox",
		tiles = tiles,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = node_groups,
		is_ground_content = false,
		sounds = final_sounds,
		node_box = { type = "fixed",
		fixed = {
				{-0.5, -0.5, -0.1875, 0.5, 0.5, 0.1875},
				{-0.1875, -0.5, -0.5, 0.1875, 0.5, 0.5},
			}
		}
	})

	-- LOW THIN WALL
	minetest.register_node("thin_walls:thin_wall_low_" .. subname, {
		description = desc .. " Low Thin Wall",
		drawtype = "nodebox",
		tiles = tiles,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = node_groups,
		is_ground_content = false,
		sounds = final_sounds,
		node_box = { type = "fixed",
		fixed = {
				{-0.5, -0.5, -0.1875, 0.5, 0.125, 0.1875}
			}
		}
	})

	-- LOW THIN WALL CORNER
	minetest.register_node("thin_walls:thin_wall_low_corner_" .. subname, {
		description = desc .. " Low Thin Wall Corner",
		drawtype = "nodebox",
		tiles = tiles,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = node_groups,
		is_ground_content = false,
		sounds = final_sounds,
		node_box = { type = "fixed",
		fixed = {
				{-0.1875, -0.5, -0.1875, 0.5, 0.125, 0.1875},
				{-0.1875, -0.5, -0.1875, 0.1875, 0.125, 0.5},
			}
		}
	})

	-- LOW THIN WALL THREE WAY
	minetest.register_node("thin_walls:thin_wall_low_three_way_" .. subname, {
		description = desc .. " Low Thin Wall (Three Way)",
		drawtype = "nodebox",
		tiles = tiles,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = node_groups,
		is_ground_content = false,
		sounds = final_sounds,
		node_box = { type = "fixed",
		fixed = {
				{-0.1875, -0.5, -0.5, 0.1875, 0.125, 0.1875},
				{-0.5, -0.5, -0.1875, 0.5, 0.125, 0.1875},
			}
		}
	})

	-- LOW THIN WALL FOUR WAY
	minetest.register_node("thin_walls:thin_wall_low_four_way_" .. subname, {
		description = desc .. " Low Thin Wall (Four Way)",
		drawtype = "nodebox",
		tiles = tiles,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = node_groups,
		is_ground_content = false,
		sounds = final_sounds,
		node_box = { type = "fixed",
		fixed = {
				{-0.5, -0.5, -0.1875, 0.5, 0.125, 0.1875},
				{-0.1875, -0.5, -0.5, 0.1875, 0.125, 0.5},
			}
		}
	})

	-- HIGH TO LOW THREE WAY
	minetest.register_node("thin_walls:thin_wall_high_low_three_way_" .. subname, {
		description = desc .. " Thin Wall High-Low (Three Way)",
		drawtype = "nodebox",
		tiles = tiles,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = node_groups,
		is_ground_content = false,
		sounds = final_sounds,
		node_box = { type = "fixed",
		fixed = {
				{-0.5, -0.5, -0.1875, 0.5, 0.5, 0.1875},
				{-0.1875, -0.5, -0.5, 0.1875, 0.125, 0.1875},
			}
		}
	})

	-- HIGH TO LOW FOUR WAY
	minetest.register_node("thin_walls:thin_wall_high_low_four_way_" .. subname, {
		description = desc .. " Thin Wall High-Low (Four Way)",
		drawtype = "nodebox",
		tiles = tiles,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = node_groups,
		is_ground_content = false,
		sounds = final_sounds,
		node_box = { type = "fixed",
		fixed = {
				{-0.5, -0.5, -0.1875, 0.5, 0.125, 0.1875},
				{-0.1875, -0.5, -0.5, 0.1875, 0.5, 0.5},
			}
		}
	})

	-- LOW TO HIGH THREE WAY
	minetest.register_node("thin_walls:thin_wall_low_high_three_way_" .. subname, {
		description = desc .. " Thin Wall Low-High (Three Way)",
		drawtype = "nodebox",
		tiles = tiles,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = node_groups,
		is_ground_content = false,
		sounds = final_sounds,
		node_box = { type = "fixed",
		fixed = {
				{-0.5, -0.5, -0.1875, 0.5, 0.125, 0.1875},
				{-0.1875, -0.5, -0.5, 0.1875, 0.5, 0.1875},
			}
		}
	})

	-- CRAFTING RECIPES

	minetest.register_craft({
		output = "thin_walls:thin_wall_" .. subname .. " 4",
		recipe = {{recipeitem}, {recipeitem}, {recipeitem}}
	})

	minetest.register_craft({
		output = "thin_walls:thin_wall_low_" .. subname .. " 6",
		recipe = {{recipeitem, recipeitem, recipeitem}}
	})

	minetest.register_craft({
		output = "thin_walls:thin_wall_two_way_" .. subname .. " 2",
		recipe = {{"thin_walls:thin_wall_" .. subname, "thin_walls:thin_wall_" .. subname}}
	})

	minetest.register_craft({
		output = "thin_walls:thin_wall_three_way_" .. subname,
		recipe = {{"thin_walls:thin_wall_" .. subname, "thin_walls:thin_wall_" .. subname, "thin_walls:thin_wall_" .. subname}}
	})
end

------------
-- Materials
------------

local default_stone_snd = minetest.get_modpath("default") and default.node_sound_stone_defaults() or nil
local default_dirt_snd  = minetest.get_modpath("default") and default.node_sound_dirt_defaults() or nil
local default_wood_snd  = minetest.get_modpath("default") and default.node_sound_wood_defaults() or nil

local materials = {

	{ "default", "brick", "Brick", {"default_brick.png"}, default_stone_snd },
	{ "default", "clay",  "Clay",  {"default_clay.png"},  default_dirt_snd  },
	{ "default", "cobble", "Cobble", {"default_cobble.png"}, default_stone_snd },
	{ "default", "mossycobble", "Mossy Cobble", {"default_mossycobble.png"}, default_stone_snd },
	{ "default", "stone", "Stone", {"default_stone.png"}, default_stone_snd },
	{ "default", "stone_block", "Stone Block", {"default_stone_block.png"}, default_stone_snd },
	{ "default", "stone_brick", "Stone Brick", {"default_stone_brick.png"}, default_stone_snd },
	{ "default", "desert_stone", "Desert Stone", {"default_desert_stone.png"}, default_stone_snd },
	{ "default", "desert_stone_block", "Desert Stone Block", {"default_desert_stone_block.png"}, default_stone_snd },
	{ "default", "desert_stone_brick", "Desert Stone Brick", {"default_desert_stone_brick.png"}, default_stone_snd },
	{ "default", "sandstone", "Sandstone", {"default_sandstone.png"}, default_stone_snd },
	{ "default", "sandstone_block", "Sandstone Block", {"default_sandstone_block.png"}, default_stone_snd },
	{ "default", "sandstone_brick", "Sandstone Brick", {"default_sandstone_brick.png"}, default_stone_snd },
	{ "default", "desert_sandstone", "Desert Sandstone", {"default_desert_sandstone.png"}, default_stone_snd },
	{ "default", "desert_sandstone_block", "Desert Sandstone Block", {"default_desert_sandstone_block.png"}, default_stone_snd },
	{ "default", "desert_sandstone_brick", "Desert Sandstone Brick", {"default_desert_sandstone_brick.png"}, default_stone_snd },
	{ "default", "silver_sandstone", "Silver Sandstone", {"default_silver_sandstone.png"}, default_stone_snd },
	{ "default", "silver_sandstone_block", "Silver Sandstone Block", {"default_silver_sandstone_block.png"}, default_stone_snd },
	{ "default", "silver_sandstone_brick", "Silver Sandstone Brick", {"default_silver_sandstone_brick.png"}, default_stone_snd },
	{ "default", "acacia_wood", "Acacia Wood", {"default_acacia_wood.png"}, default_wood_snd  },
	{ "default", "aspen_wood", "Aspen Wood", {"default_aspen_wood.png"}, default_wood_snd  },
	{ "default", "junglewood", "Junglewood", {"default_junglewood.png"}, default_wood_snd  },
	{ "default", "pine_wood", "Pine Wood", {"default_pine_wood.png"}, default_wood_snd  },
	{ "default", "wood", "Wooden", {"default_wood.png"}, default_wood_snd  },
	{ "granite", "stanstead_1", "Stanstead Granite", {"granite_stanstead_milled_1.png"}, default_stone_snd },

}

for _, mat in ipairs(materials) do
	thin_walls.register_walls(mat[1], mat[2], mat[3], mat[4], mat[5])
end
