-- [MOD] Arches [arches] (1.2) by TumeniNodes

arches = {}

-- ARCHES
function arches.register_arch(subname, groups, images, description, sounds)
	minetest.register_node("arches:arch_" .. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = groups,
		is_ground_content = false,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.125, -0.5, 0.5, 0.5, 0.5},
				{0.1875, -0.1875, -0.5, 0.5, -0.125, 0.5},
				{-0.5, -0.1875, -0.5, -0.1875, -0.125, 0.5},
				{-0.5, -0.25, -0.5, -0.3125, -0.1875, 0.5},
				{0.3125, -0.25, -0.5, 0.5, -0.1875, 0.5},
				{0.375, -0.3125, -0.5, 0.5, -0.25, 0.5},
				{-0.5, -0.3125, -0.5, -0.375, -0.25, 0.5},
				{-0.5, -0.4375, -0.5, -0.4375, -0.3125, 0.5},
				{0.4375, -0.4375, -0.5, 0.5, -0.3125, 0.5},
			}
		}
	})
end

-- HALF ARCHES
function arches.register_arch_half(subname, groups, images, description, sounds)
	minetest.register_node("arches:arch_half_" .. subname, {
		description = description .. " (Half)",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = groups,
		is_ground_content = false,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, 0.3125, -0.5, 0.5, 0.5, 0.5},
				{0.1875, 0.25, -0.5, 0.5, 0.3125, 0.5},
				{-0.5, 0.25, -0.5, -0.1875, 0.3125, 0.5},
				{-0.5, 0.1875, -0.5, -0.3125, 0.25, 0.5},
				{0.3125, 0.1875, -0.5, 0.5, 0.25, 0.5},
				{0.375, 0.125, -0.5, 0.5, 0.1875, 0.5},
				{-0.5, 0.125, -0.5, -0.375, 0.1875, 0.5},
				{0.4375, 0, -0.5, 0.5, 0.125, 0.5},
				{-0.5, 0, -0.5, -0.4375, 0.125, 0.5},
			}
		}
	})
end

-- MULTI-WAY ARCHES (Two Way, Three Way, Four Way)
function arches.register_arch_variants(subname, groups, images, description, sounds)
	minetest.register_node("arches:arch_two_way_" .. subname, {
		description = description .. " (Two Way)",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = groups,
		is_ground_content = false,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.125, -0.5, 0.5, 0.5, 0.5},
				{0.1875, -0.1875, -0.5, 0.5, -0.125, -0.1875},
				{-0.5, -0.1875, -0.5, -0.1875, -0.125, 0.5},
				{-0.5, -0.25, -0.5, -0.3125, -0.1875, 0.5},
				{0.3125, -0.25, -0.5, 0.5, -0.1875, -0.3125},
				{0.375, -0.3125, -0.5, 0.5, -0.25, -0.375},
				{-0.5, -0.3125, -0.5, -0.375, -0.25, 0.5},
				{-0.5, -0.4375, -0.5, -0.4375, -0.3125, 0.5},
				{0.4375, -0.4375, -0.5, 0.5, -0.3125, -0.4375},
				{-0.5, -0.1875, 0.1875, 0.5, -0.125, 0.5},
				{-0.5, -0.25, 0.3125, 0.5, -0.1875, 0.5},
				{-0.5, -0.3125, 0.375, 0.5, -0.25, 0.5},
				{-0.5, -0.4375, 0.4375, 0.5, -0.3125, 0.5},
			}
		}
	})

	minetest.register_node("arches:arch_three_way_" .. subname, {
		description = description .. " (Three Way)",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = groups,
		is_ground_content = false,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.125, -0.5, 0.5, 0.5, 0.5},
				{0.1875, -0.1875, -0.5, 0.5, -0.125, -0.1875},
				{-0.5, -0.1875, -0.5, -0.1875, -0.125, -0.1875},
				{-0.5, -0.25, -0.5, -0.3125, -0.1875, -0.3125},
				{0.3125, -0.25, -0.5, 0.5, -0.1875, -0.3125},
				{0.375, -0.3125, -0.5, 0.5, -0.25, -0.375},
				{-0.5, -0.3125, -0.5, -0.375, -0.25, -0.375},
				{-0.5, -0.4375, -0.5, -0.4375, -0.3125, -0.4375},
				{0.4375, -0.4375, -0.5, 0.5, -0.3125, -0.4375},
				{-0.5, -0.1875, 0.1875, 0.5, -0.125, 0.5},
				{-0.5, -0.25, 0.3125, 0.5, -0.1875, 0.5},
				{-0.5, -0.3125, 0.375, 0.5, -0.25, 0.5},
				{-0.5, -0.4375, 0.4375, 0.5, -0.3125, 0.5},
			}
		}
	})

	minetest.register_node("arches:arch_four_way_" .. subname, {
		description = description .. " (Four Way)",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = groups,
		is_ground_content = false,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.125, -0.5, 0.5, 0.5, 0.5},
				{0.1875, -0.1875, -0.5, 0.5, -0.125, -0.1875},
				{-0.5, -0.1875, -0.5, -0.1875, -0.125, -0.1875},
				{-0.5, -0.25, -0.5, -0.3125, -0.1875, -0.3125},
				{0.3125, -0.25, -0.5, 0.5, -0.1875, -0.3125},
				{0.375, -0.3125, -0.5, 0.5, -0.25, -0.375},
				{-0.5, -0.3125, -0.5, -0.375, -0.25, -0.375},
				{-0.5, -0.4375, -0.5, -0.4375, -0.3125, -0.4375},
				{0.4375, -0.4375, -0.5, 0.5, -0.3125, -0.4375},
				{-0.5, -0.1875, 0.1875, -0.1875, -0.125, 0.5},
				{-0.5, -0.25, 0.3125, -0.3125, -0.1875, 0.5},
				{-0.5, -0.3125, 0.375, -0.375, -0.25, 0.5},
				{-0.5, -0.4375, 0.4375, -0.4375, -0.3125, 0.5},
				{0.4375, -0.4375, 0.4375, 0.5, -0.3125, 0.5},
				{0.375, -0.3125, 0.375, 0.5, -0.25, 0.5},
				{0.3125, -0.25, 0.3125, 0.5, -0.1875, 0.5},
				{0.1875, -0.1875, 0.1875, 0.5, -0.125, 0.5},
			}
		}
	})
end

-- THIN ARCHES
function arches.register_arch_thin(subname, groups, images, description, sounds)
	minetest.register_node("arches:arch_thin_" .. subname, {
		description = description .. " (Thin)",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = groups,
		is_ground_content = false,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.125, -0.1875, 0.5, 0.5, 0.1875},
				{0.1875, -0.1875, -0.1875, 0.5, -0.125, 0.1875},
				{-0.5, -0.1875, -0.1875, -0.1875, -0.125, 0.1875},
				{-0.5, -0.25, -0.1875, -0.3125, -0.1875, 0.1875},
				{0.3125, -0.25, -0.1875, 0.5, -0.1875, 0.1875},
				{0.375, -0.3125, -0.1875, 0.5, -0.25, 0.1875},
				{-0.5, -0.3125, -0.1875, -0.375, -0.25, 0.1875},
				{-0.5, -0.4375, -0.1875, -0.4375, -0.3125, 0.1875},
				{0.4375, -0.4375, -0.1875, 0.5, -0.3125, 0.1875},
			}
		}
	})

	minetest.register_node("arches:arch_thin_half_" .. subname, {
		description = description .. " (Thin Half)",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = groups,
		is_ground_content = false,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, 0.3125, -0.1875, 0.5, 0.5, 0.1875},
				{0.1875, 0.25, -0.1875, 0.5, 0.3125, 0.1875},
				{-0.5, 0.25, -0.1875, -0.1875, 0.3125, 0.1875},
				{-0.5, 0.1875, -0.1875, -0.3125, 0.25, 0.1875},
				{0.3125, 0.1875, -0.1875, 0.5, 0.25, 0.1875},
				{0.375, 0.125, -0.1875, 0.5, 0.1875, 0.1875},
				{-0.5, 0.125, -0.1875, -0.375, 0.1875, 0.1875},
				{-0.5, 0, -0.1875, -0.4375, 0.125, 0.1875},
				{0.4375, 0, -0.1875, 0.5, 0.125, 0.1875},
			}
		}
	})
end

------------------------------
-- Register Nodes/Materials
------------------------------
function arches.register_all_arches(subname, groups, images, description, sounds, recipeitem)
	arches.register_arch(subname, groups, images, description, sounds)
	arches.register_arch_half(subname, groups, images, description, sounds)
	arches.register_arch_variants(subname, groups, images, description, sounds)
	arches.register_arch_thin(subname, groups, images, description, sounds)

	-- Crafting
	if recipeitem then
		-- Standard Arch
		minetest.register_craft({
			output = "arches:arch_" .. subname .. " 4",
			recipe = {
				{recipeitem, recipeitem, recipeitem},
				{recipeitem, "",         recipeitem},
				{recipeitem, "",         recipeitem},
			}
		})

		-- Half Arch
		minetest.register_craft({
			output = "arches:arch_half_" .. subname .. " 4",
			recipe = {
				{recipeitem, recipeitem, recipeitem},
				{"",         "",         ""},
				{"",         "",         ""},
			}
		})

		-- Thin Arch
		minetest.register_craft({
			output = "arches:arch_thin_" .. subname .. " 6",
			recipe = {
				{"",         recipeitem, ""},
				{recipeitem, "",         recipeitem},
				{recipeitem, "",         recipeitem},
			}
		})

		-- Two Way, Three Way, Four Way
		minetest.register_craft({
			output = "arches:arch_two_way_" .. subname .. " 2",
			recipe = {
				{"arches:arch_" .. subname, "arches:arch_" .. subname},
			}
		})

		minetest.register_craft({
			output = "arches:arch_three_way_" .. subname,
			recipe = {
				{"arches:arch_" .. subname, "arches:arch_" .. subname, "arches:arch_" .. subname},
			}
		})

		minetest.register_craft({
			output = "arches:arch_four_way_" .. subname,
			recipe = {
				{"arches:arch_" .. subname, "arches:arch_" .. subname},
				{"arches:arch_" .. subname, "arches:arch_" .. subname},
			}
		})
	end
end

arches.register_all_arches(
	"brick",
	{cracky = 3, stone = 1},
	{"default_brick.png"},
	"Brick Arches",
	default.node_sound_stone_defaults(),
	"default:brick"
)

arches.register_all_arches(
	"clay",
	{crumbly = 3},
	{"default_clay.png"},
	"Clay Arches",
	default.node_sound_dirt_defaults(),
	"default:clay"
)

arches.register_all_arches(
	"cobble",
	{cracky = 3, stone = 1},
	{"default_cobble.png"},
	"Cobble Arches",
	default.node_sound_stone_defaults(),
	"default:cobble"
)

arches.register_all_arches(
	"mossycobble",
	{cracky = 3, stone = 1},
	{"default_mossycobble.png"},
	"Mossy Cobble Arches",
	default.node_sound_stone_defaults(),
	"default:mossycobble"
)

arches.register_all_arches(
	"stone",
	{cracky = 3, stone = 1},
	{"default_stone.png"},
	"Stone Arches",
	default.node_sound_stone_defaults(),
	"default:stone"
)

arches.register_all_arches(
	"stone_block",
	{cracky = 3, stone = 1},
	{"default_stone_block.png"},
	"Stone Block Arches",
	default.node_sound_stone_defaults(),
	"default:stone_block"
)

arches.register_all_arches(
	"stone_brick",
	{cracky = 3, stone = 1},
	{"default_stone_brick.png"},
	"Stone Brick Arches",
	default.node_sound_stone_defaults(),
	"default:stone_brick"
)

arches.register_all_arches(
	"desert_stone",
	{cracky = 3, stone = 1},
	{"default_desert_stone.png"},
	"Desert Stone Arches",
	default.node_sound_stone_defaults(),
	"default:desert_stone"
)

arches.register_all_arches(
	"desert_stone_block",
	{cracky = 3, stone = 1},
	{"default_desert_stone_block.png"},
	"Desert Stone Block Arches",
	default.node_sound_stone_defaults(),
	"default:desert_stone_block"
)

arches.register_all_arches(
	"desert_stone_brick",
	{cracky = 3, stone = 1},
	{"default_desert_stone_brick.png"},
	"Desert Stone Brick Arches",
	default.node_sound_stone_defaults(),
	"default:desert_stone_brick"
)

arches.register_all_arches(
	"sandstone",
	{cracky = 3, stone = 1},
	{"default_sandstone.png"},
	"Sandstone Arches",
	default.node_sound_stone_defaults(),
	"default:sandstone"
)

arches.register_all_arches(
	"sandstone_block",
	{cracky = 3, stone = 1},
	{"default_sandstone_block.png"},
	"Sandstone Block Arches",
	default.node_sound_stone_defaults(),
	"default:sandstone_block"
)

arches.register_all_arches(
	"sandstone_brick",
	{cracky = 3, stone = 1},
	{"default_sandstone_brick.png"},
	"Sandstone Brick Arches",
	default.node_sound_stone_defaults(),
	"default:sandstone_brick"
)

arches.register_all_arches(
	"desert_sandstone",
	{cracky = 3, stone = 1},
	{"default_desert_sandstone.png"},
	"Desert Sandstone Arches",
	default.node_sound_stone_defaults(),
	"default:desert_sandstone"
)

arches.register_all_arches(
	"desert_sandstone_block",
	{cracky = 3, stone = 1},
	{"default_desert_sandstone_block.png"},
	"Desert Sandstone Block Arches",
	default.node_sound_stone_defaults(),
	"default:desert_sandstone_block"
)

arches.register_all_arches(
	"desert_sandstone_brick",
	{cracky = 3, stone = 1},
	{"default_desert_sandstone_brick.png"},
	"Desert Sandstone Brick Arches",
	default.node_sound_stone_defaults(),
	"default:desert_sandstone_brick"
)

arches.register_all_arches(
	"silver_sandstone",
	{cracky = 3, stone = 1},
	{"default_silver_sandstone.png"},
	"Silver Sandstone Arches",
	default.node_sound_stone_defaults(),
	"default:silver_sandstone"
)

arches.register_all_arches(
	"silver_sandstone_block",
	{cracky = 3, stone = 1},
	{"default_silver_sandstone_block.png"},
	"Silver Sandstone Block Arches",
	default.node_sound_stone_defaults(),
	"default:silver_sandstone_block"
)

arches.register_all_arches(
	"silver_sandstone_brick",
	{cracky = 3, stone = 1},
	{"default_silver_sandstone_brick.png"},
	"Silver Sandstone Brick Arches",
	default.node_sound_stone_defaults(),
	"default:silver_sandstone_brick"
)

arches.register_all_arches(
	"acacia_wood",
	{snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	{"default_acacia_wood.png"},
	"Acacia Wood Arches",
	default.node_sound_wood_defaults(),
	"default:acacia_wood"
)

arches.register_all_arches(
	"aspen_wood",
	{snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	{"default_aspen_wood.png"},
	"Aspen Wood Arches",
	default.node_sound_wood_defaults(),
	"default:aspen_wood"
)

arches.register_all_arches(
	"junglewood",
	{snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	{"default_junglewood.png"},
	"Junglewood Arches",
	default.node_sound_wood_defaults(),
	"default:junglewood"
)

arches.register_all_arches(
	"pine_wood",
	{snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	{"default_pine_wood.png"},
	"Pine Wood Arches",
	default.node_sound_wood_defaults(),
	"default:pine_wood"
)

arches.register_all_arches(
	"wood",
	{snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	{"default_wood.png"},
	"Wooden Arches",
	default.node_sound_wood_defaults(),
	"default:wood"
)
