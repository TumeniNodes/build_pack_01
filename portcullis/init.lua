-- [Mod]Portcullis [portcullis] (Ver. 0.1) for Minetest Game
-- MIT Copyright (c) 2015-2026 TumeniNodes

super_high = super_high or {}
portcullis = {}

local ANIM_SPEED = 0.25

local FACEDIR_TO_SIDE_VECTORS = {
	[0] = {x = 1, y = 0, z = 0},  -- Facing North: Sides are East/West (X-axis)
	[1] = {x = 0, y = 0, z = -1}, -- Facing East: Sides are North/South (Z-axis)
	[2] = {x = -1, y = 0, z = 0}, -- Facing South: Sides are East/West (X-axis)
	[3] = {x = 0, y = 0, z = 1},  -- Facing West: Sides are North/South (Z-axis)
}

local function get_side_vectors(param2)
	local dir = (param2 or 0) % 4
	local vec = FACEDIR_TO_SIDE_VECTORS[dir] or {x = 1, y = 0, z = 0}
	return vec, {x = -vec.x, y = 0, z = -vec.z}
end

local function find_connected_gate_nodes(start_pos)
	local start_node = minetest.get_node(start_pos)
	local base_name = start_node.name:match("^(portcullis:[%w_]+_portcullis_)")
	if not base_name then return {} end

	local left_vec, right_vec = get_side_vectors(start_node.param2)
	local connected = { {pos = vector.new(start_pos), node = start_node} }
	local visited = { [minetest.pos_to_string(start_pos)] = true }

	local function scan_direction(direction_vec)
		local current_pos = vector.new(start_pos)
		while true do
			current_pos = vector.add(current_pos, direction_vec)
			local hash = minetest.pos_to_string(current_pos)
			if visited[hash] then break end

			local check_node = minetest.get_node(current_pos)
			if check_node.name == start_node.name and check_node.param2 == start_node.param2 then
				visited[hash] = true
				table.insert(connected, {pos = vector.new(current_pos), node = check_node})
			else
				break
			end
		end
	end

	scan_direction(left_vec)
	scan_direction(right_vec)
	return connected
end

local function transition_portcullis(pos, next_node_suffix, dir_meta)
	local node = minetest.get_node(pos)
	local base_name = node.name:match("^(portcullis:[%w_]+_portcullis_)")
	if not base_name then return end

	node.name = base_name .. next_node_suffix
	minetest.swap_node(pos, node)

	if next_node_suffix == "half" then
		local meta = minetest.get_meta(pos)
		meta:set_string("anim_dir", dir_meta)

		local timer = minetest.get_node_timer(pos)
		timer:start(ANIM_SPEED)
	end
end

local function global_interact_gate(pos, next_state, dir_meta, sound_effect)
	local connected_nodes = find_connected_gate_nodes(pos)
	if #connected_nodes > 0 then
		minetest.sound_play(sound_effect, {pos = pos, gain = 0.5}, true)
	end
	for _, entry in ipairs(connected_nodes) do
		transition_portcullis(entry.pos, next_state, dir_meta)
	end
end

function super_high.register_portcullis(name, desc, tiles, groups, sounds, recipeitem)
	sounds = sounds or default.node_sound_metal_defaults()
	groups = groups or {cracky = 3, stone = 2}

	local closed_groups = table.copy(groups)
	local open_groups = table.copy(groups)
	open_groups.solidness = 0

	-- CLOSED
	minetest.register_node("portcullis:" .. name .. "_portcullis_closed", {
		description = "Portcullis " .. desc,
		drawtype = "mesh",
		mesh = "portcullis.obj",
		tiles = tiles,
		use_texture_alpha = "clip",
		paramtype = "light",
		paramtype2 = "facedir",
		groups = closed_groups,
		is_ground_content = false,
		sounds = sounds,
		selection_box = {
			type = "fixed",
			fixed = {{-0.5, -1.5, -0.0625, 0.5, 1.5, 0.0625}}
		},
		collision_box = {
			type = "fixed",
			fixed = {{-0.5, -1.5, -0.0625, 0.5, 1.5, 0.0625}}
		},
		on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
			global_interact_gate(pos, "half", "open", "portcullis_open")
		end
	})

	-- HALF
	minetest.register_node("portcullis:" .. name .. "_portcullis_half", {
		description = "Portcullis " .. desc .. " (Moving)",
		drawtype = "mesh",
		mesh = "portcullis_half.obj",
		tiles = tiles,
		use_texture_alpha = "clip",
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {not_in_creative_inventory = 1},
		is_ground_content = false,
		sounds = sounds,
		selection_box = {
			type = "fixed",
			fixed = {{-0.5, -0.375, -0.0625, 0.5, 1.5, 0.0625}}
		},
		collision_box = {
			type = "fixed",
			fixed = {{-0.5, -0.375, -0.0625, 0.5, 1.5, 0.0625}}
		},
		on_timer = function(pos, elapsed)
			local meta = minetest.get_meta(pos)
			local direction = meta:get_string("anim_dir")

			if direction == "open" then
				transition_portcullis(pos, "open")
			else
				transition_portcullis(pos, "closed")
			end
			return false
		end
	})

	-- OPEN
	minetest.register_node("portcullis:" .. name .. "_portcullis_open", {
		description = "Portcullis " .. desc .. " (Open)",
		drawtype = "mesh",
		mesh = "portcullis_open.obj",
		tiles = tiles,
		use_texture_alpha = "clip",
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {not_in_creative_inventory = 1},
		is_ground_content = false,
		sounds = sounds,
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {{-0.5, 0.75, -0.0625, 0.5, 1.5, 0.0625}}
		},
		on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
			global_interact_gate(pos, "half", "close", "portcullis_close")
		end
	})
end

-- ======================
-- MATERIAL REGISTRATIONS
-- ======================

super_high.register_portcullis(
	"old_wood", "Old Wood",
	{"default_junglewood.png^[transformR90"},
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	default.node_sound_wood_defaults(),
	"default:fence_junglewood"
)

super_high.register_portcullis(
	"wrought_iron", "Wrought Iron",
	{"default_obsidian.png^[transformR90"},
	{cracky = 1, level = 2},
	default.node_sound_metal_defaults(),
	"default:iron_lump"
)

super_high.register_portcullis(
	"steel", "Steel",
	{"default_stone.png^[transformR90"},
	{cracky = 1, level = 2},
	default.node_sound_metal_defaults(),
	"default:steel_ingot"
)

super_high.register_portcullis(
	"rusted_iron", "Rusted Iron",
	{"default_rainforest_litter.png"},
	{cracky = 1, level = 2},
	default.node_sound_metal_defaults(),
	"default:dirt"
)
