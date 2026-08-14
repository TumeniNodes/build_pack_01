-- [Mod]Super High [super_high] (Ver. 0.1) for Minetest Game
-- Copyright (c) 2015-2026 TumeniNodes

super_high = {}

function super_high.register_fence(name, desc, tiles, sounds, groups, recipeitem)
	sounds = sounds or default.node_sound_metal_defaults()
	groups = groups or {cracky = 3, stone = 2}

	-- Standard Flat Fence
	minetest.register_node("super_high:" .. name .. "_fence", {
		description = "Super High " .. desc,
		drawtype = "nodebox",
		tiles = tiles,
		use_texture_alpha = true,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = groups,
		is_ground_content = false,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -1.5, -0.0625, 0.5, 1.5, 0},
			}
		}
	})

	-- Corner Fence
	minetest.register_node("super_high:" .. name .. "_fence_corner", {
		description = "Super High " .. desc .. " Corner",
		drawtype = "nodebox",
		tiles = tiles,
		use_texture_alpha = true,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = groups,
		is_ground_content = false,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.0625, -1.5, -0.0625, 0.5, 1.5, 0},
				{-0.0625, -1.5, 0, 0, 1.5, 0.5},
			}
		}
	})

	-- Inside Corner (ICorner) Fence
	minetest.register_node("super_high:" .. name .. "_fence_icorner", {
		description = "Super High " .. desc .. " ICorner",
		drawtype = "nodebox",
		tiles = tiles,
		use_texture_alpha = true,
		paramtype = "light",
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = groups,
		is_ground_content = false,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{0, -1.5, -0.0625, 0.5, 1.5, 0},
				{0, -1.5, -0.5, 0.0625, 1.5, -0.0625},
			}
		}
	})

    -----------
	-- Crafting
	-----------

	if recipeitem then

		-- Craft Fence
		minetest.register_craft({
			output = "super_high:" .. name .. "_fence 2",
			recipe = {
				{recipeitem},
				{recipeitem},
				{recipeitem},
			}
		})

		-- Craft Corner
		minetest.register_craft({
			output = "super_high:" .. name .. "_fence_corner 2",
			recipe = {
				{"super_high:" .. name .. "_fence", "super_high:" .. name .. "_fence"},
			}
		})

		-- Craft ICorner
		minetest.register_craft({
			output = "super_high:" .. name .. "_fence_icorner 2",
			recipe = {
				{"super_high:" .. name .. "_fence"},
				{"super_high:" .. name .. "_fence"},
			}
		})
	end
end


-- ======================
-- MATERIAL REGISTRATIONS
-- ======================

super_high.register_fence(
	"old_wood",
	"Old Wood Fence",
	{
		"super_high_fence_top.png", "super_high_fence_top.png",
		"super_high_old_wood_fence.png", "super_high_old_wood_fence.png",
		"super_high_old_wood_fence.png", "super_high_old_wood_fence.png"
	},
	default.node_sound_wood_defaults(),
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	"default:fence_wood"
)

super_high.register_fence(
	"wrought_iron",
	"Wrought Iron Fence",
	{
		"super_high_fence_top.png", "super_high_fence_top.png",
		"super_high_wrought_iron_fence.png", "super_high_wrought_iron_fence.png",
		"super_high_wrought_iron_fence.png", "super_high_wrought_iron_fence.png"
	},
	default.node_sound_metal_defaults(),
	{cracky = 1, level = 2},
	"default:iron_lump"
)

super_high.register_fence(
	"steel",
	"Steel Fence",
	{
		"super_high_fence_top.png", "super_high_fence_top.png",
		"super_high_steel_fence.png", "super_high_steel_fence.png",
		"super_high_steel_fence.png", "super_high_steel_fence.png"
	},
	default.node_sound_metal_defaults(),
	{cracky = 1, level = 2},
	"default:steel_ingot"
)

super_high.register_fence(
	"rusted_iron",
	"Rusted Iron Fence",
	{"super_high_rusted_iron_fence.png"},
	default.node_sound_metal_defaults(),
	{cracky = 1, level = 2},
	"default:dirt"
)
