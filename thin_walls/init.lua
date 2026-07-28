-- [MOD] Thin Walls [thin_walls] (0.1) by TumeniNodes

thin_walls = {}

function thin_walls.register_walls(subname, groups, images, label, sounds, recipeitem)
	
	local node_groups = {}
	for k, v in pairs(groups) do
		node_groups[k] = v
	end
	
	node_groups.thin_wall = 1
	node_groups.creative = 1

	-- THIN WALLS
	minetest.register_node("thin_walls:thin_wall_" .. subname, {
		description = label .. " Thin Wall",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = node_groups,
		is_ground_content = false,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.1875, 0.5, 0.5, 0.1875},
			}
		}
	})

	minetest.register_node("thin_walls:thin_wall_two_way_" .. subname, {
		description = label .. " Thin Wall (Two Way)",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = node_groups,
		is_ground_content = false,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.1875, 0.1875, 0.5, 0.1875},
				{-0.1875, -0.5, -0.5, 0.1875, 0.5, 0.1875},
			}
		}
	})

	minetest.register_node("thin_walls:thin_wall_three_way_" .. subname, {
		description = label .. " Thin Wall (Three Way)",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = node_groups,
		is_ground_content = false,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.1875, 0.5, 0.5, 0.1875},
				{-0.1875, -0.5, -0.5, 0.1875, 0.5, 0.1875},
			}
		}
	})

	minetest.register_node("thin_walls:thin_wall_four_way_" .. subname, {
		description = label .. " Thin Wall (Four Way)",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = node_groups,
		is_ground_content = false,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.1875, 0.5, 0.5, 0.1875},
				{-0.1875, -0.5, -0.5, 0.1875, 0.5, 0.5},
			}
		}
	})


	-- LOW THIN WALLS
	minetest.register_node("thin_walls:thin_wall_low_" .. subname, {
		description = label .. " Low Thin Wall",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = node_groups,
		is_ground_content = false,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.1875, 0.5, 0.125, 0.1875},
			}
		}
	})

	minetest.register_node("thin_walls:thin_wall_low_corner_" .. subname, {
		description = label .. " Low Thin Wall Corner",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = node_groups,
		is_ground_content = false,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.1875, -0.5, -0.1875, 0.5, 0.125, 0.1875},
				{-0.1875, -0.5, -0.1875, 0.1875, 0.125, 0.5},
			}
		}
	})

	minetest.register_node("thin_walls:thin_wall_low_three_way_" .. subname, {
		description = label .. " Low Thin Wall (Three Way)",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = node_groups,
		is_ground_content = false,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.1875, -0.5, -0.5, 0.1875, 0.125, 0.1875},
				{-0.5, -0.5, -0.1875, 0.5, 0.125, 0.1875},
			}
		}
	})

	minetest.register_node("thin_walls:thin_wall_low_four_way_" .. subname, {
		description = label .. " Low Thin Wall (Four Way)",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = node_groups,
		is_ground_content = false,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.1875, 0.5, 0.125, 0.1875},
				{-0.1875, -0.5, -0.5, 0.1875, 0.125, 0.5},
			}
		}
	})


	-- HIGH TO LOW WALLS
	minetest.register_node("thin_walls:thin_wall_high_low_three_way_" .. subname, {
		description = label .. " Thin Wall High-Low (Three Way)",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = node_groups,
		is_ground_content = false,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.1875, 0.5, 0.5, 0.1875},
				{-0.1875, -0.5, -0.5, 0.1875, 0.125, 0.1875},
			}
		}
	})

	minetest.register_node("thin_walls:thin_wall_high_low_four_way_" .. subname, {
		description = label .. " Thin Wall High-Low (Four Way)",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = node_groups,
		is_ground_content = false,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.1875, 0.5, 0.125, 0.1875},
				{-0.1875, -0.5, -0.5, 0.1875, 0.5, 0.5},
			}
		}
	})

	minetest.register_node("thin_walls:thin_wall_low_high_three_way_" .. subname, {
		description = label .. " Thin Wall Low-High (Three Way)",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = node_groups,
		is_ground_content = false,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.1875, 0.5, 0.125, 0.1875},
				{-0.1875, -0.5, -0.5, 0.1875, 0.5, 0.1875},
			}
		}
	})

	-- CRAFTING
	if recipeitem then
		-- Craft Thin Wall
		minetest.register_craft({
			output = "thin_walls:thin_wall_" .. subname .. " 4",
			recipe = {
				{recipeitem},
				{recipeitem},
				{recipeitem},
			}
		})

		-- Craft Low Thin Wall
		minetest.register_craft({
			output = "thin_walls:thin_wall_low_" .. subname .. " 6",
			recipe = {
				{recipeitem, recipeitem, recipeitem},
			}
		})

		-- Inter-craft variations using standard thin walls
		minetest.register_craft({
			output = "thin_walls:thin_wall_two_way_" .. subname .. " 2",
			recipe = {
				{"thin_walls:thin_wall_" .. subname, "thin_walls:thin_wall_" .. subname},
			}
		})

		minetest.register_craft({
			output = "thin_walls:thin_wall_three_way_" .. subname,
			recipe = {
				{"thin_walls:thin_wall_" .. subname, "thin_walls:thin_wall_" .. subname, "thin_walls:thin_wall_" .. subname},
			}
		})
	end
end


-- ======================
-- MATERIAL REGISTRATIONS
-- ======================

thin_walls.register_walls(
	"brick",
	{cracky = 3, stone = 1},
	{"default_brick.png"},
	"Brick",
	default.node_sound_stone_defaults(),
	"default:brick"
)

thin_walls.register_walls(
	"clay",
	{crumbly = 3},
	{"default_clay.png"},
	"Clay",
	default.node_sound_dirt_defaults(),
	"default:clay"
)

thin_walls.register_walls(
	"cobble",
	{cracky = 3, stone = 1},
	{"default_cobble.png"},
	"Cobble",
	default.node_sound_stone_defaults(),
	"default:cobble"
)

thin_walls.register_walls(
	"mossycobble",
	{cracky = 3, stone = 1},
	{"default_mossycobble.png"},
	"Mossy Cobble",
	default.node_sound_stone_defaults(),
	"default:mossycobble"
)

thin_walls.register_walls(
	"stone",
	{cracky = 3, stone = 1},
	{"default_stone.png"},
	"Stone",
	default.node_sound_stone_defaults(),
	"default:stone"
)

thin_walls.register_walls(
	"stone_block",
	{cracky = 3, stone = 1},
	{"default_stone_block.png"},
	"Stone Block",
	default.node_sound_stone_defaults(),
	"default:stone_block"
)

thin_walls.register_walls(
	"stone_brick",
	{cracky = 3, stone = 1},
	{"default_stone_brick.png"},
	"Stone Brick",
	default.node_sound_stone_defaults(),
	"default:stone_brick"
)

thin_walls.register_walls(
	"desert_stone",
	{cracky = 3, stone = 1},
	{"default_desert_stone.png"},
	"Desert Stone",
	default.node_sound_stone_defaults(),
	"default:desert_stone"
)

thin_walls.register_walls(
	"desert_stone_block",
	{cracky = 3, stone = 1},
	{"default_desert_stone_block.png"},
	"Desert Stone Block",
	default.node_sound_stone_defaults(),
	"default:desert_stone_block"
)

thin_walls.register_walls(
	"desert_stone_brick",
	{cracky = 3, stone = 1},
	{"default_desert_stone_brick.png"},
	"Desert Stone Brick",
	default.node_sound_stone_defaults(),
	"default:desert_stone_brick"
)

thin_walls.register_walls(
	"sandstone",
	{cracky = 3, stone = 1},
	{"default_sandstone.png"},
	"Sandstone",
	default.node_sound_stone_defaults(),
	"default:sandstone"
)

thin_walls.register_walls(
	"sandstone_block",
	{cracky = 3, stone = 1},
	{"default_sandstone_block.png"},
	"Sandstone_Block",
	default.node_sound_stone_defaults(),
	"default:sandstone_block"
)

thin_walls.register_walls(
	"sandstone_brick",
	{cracky = 3, stone = 1},
	{"default_sandstone_brick.png"},
	"Sandstone_Brick",
	default.node_sound_stone_defaults(),
	"default:sandstone_brick"
)

thin_walls.register_walls(
	"desert_sandstone",
	{cracky = 3, stone = 1},
	{"default_desert_sandstone.png"},
	"Desert Sandstone",
	default.node_sound_stone_defaults(),
	"default:desert_sandstone"
)

thin_walls.register_walls(
	"desert_sandstone_block",
	{cracky = 3, stone = 1},
	{"default_desert_sandstone_block.png"},
	"Desert Sandstone_Block",
	default.node_sound_stone_defaults(),
	"default:desert_sandstone_block"
)

thin_walls.register_walls(
	"sandstone_brick",
	{cracky = 3, stone = 1},
	{"default_desert_sandstone_brick.png"},
	"Desert Sandstone_Brick",
	default.node_sound_stone_defaults(),
	"default:desert_sandstone_brick"
)

thin_walls.register_walls(
	"silver_sandstone",
	{cracky = 3, stone = 1},
	{"default_silver_sandstone.png"},
	"Silver Sandstone",
	default.node_sound_stone_defaults(),
	"default:silver_sandstone"
)

thin_walls.register_walls(
	"silver_sandstone_block",
	{cracky = 3, stone = 1},
	{"default_silver_sandstone_block.png"},
	"Silver Sandstone_Block",
	default.node_sound_stone_defaults(),
	"default:silver_sandstone_block"
)

thin_walls.register_walls(
	"silver_sandstone_brick",
	{cracky = 3, stone = 1},
	{"default_silver_sandstone_brick.png"},
	"Silver Sandstone_Brick",
	default.node_sound_stone_defaults(),
	"default:silver_sandstone_brick"
)

thin_walls.register_walls(
	"acacia_wood",
	{snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	{"default_acacia_wood.png"},
	"Acacia Wood",
	default.node_sound_wood_defaults(),
	"default:acacia_wood"
)

thin_walls.register_walls(
	"aspen_wood",
	{snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	{"default_aspen_wood.png"},
	"Aspen Wood",
	default.node_sound_wood_defaults(),
	"default:aspen_wood"
)

thin_walls.register_walls(
	"junglewood",
	{snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	{"default_junglewood.png"},
	"Junglewood",
	default.node_sound_wood_defaults(),
	"default:junglewood"
)

thin_walls.register_walls(
	"pine_wood",
	{snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	{"default_pine_wood.png"},
	"Pine Wood",
	default.node_sound_wood_defaults(),
	"default:pine_wood"
)

thin_walls.register_walls(
	"wood",
	{snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	{"default_wood.png"},
	"Wooden",
	default.node_sound_wood_defaults(),
	"default:wood"
)
