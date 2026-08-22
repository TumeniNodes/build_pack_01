-- [Mod]Drawbridge [drawbridge] [Ver. 0.1]
-- Copyright (c) 2015-2016 TumniNodes

minetest.register_node("drawbridge:bridge_collision_helper", {
	description = "Bridge Collision Helper",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = true,
	pointable = false,
	diggable = false,
	tiles = {"blank.png"},
	use_texture_alpha = "clip",
	node_box = {
		type = "fixed",
			fixed = {-1.5, -0.5, -0.5, 1.5, -0.25, 0.5},
	},
	collision_box = {
		type = "fixed",
			fixed = {-1.5, -0.5, -0.5, 1.5, -0.25, 0.5},
	},
	groups = {not_in_creative_inventory = 1, fall_damage_add_nodes = 1},
	is_ground_content = false,
	sounds = default.node_sound_wood_defaults(),
	on_blast = function(pos, intensity) end,
})

local old_add_node = minetest.set_node
function minetest.set_node(pos, node)
	local current_node = minetest.get_node_or_nil(pos)

	local node_below = minetest.get_node_or_nil({x=pos.x, y=pos.y - 1, z=pos.z})

	if current_node or node_below then
		if (current_node and (current_node.name == "drawbridge:bridge_collision_helper" or string.find(current_node.name, "^drawbridge:drawbridge"))) or
		   (node_below and string.find(node_below.name, "^drawbridge:drawbridge")) then

			if minetest.get_item_group(node.name, "falling_node") > 0 then
				minetest.add_item({x=pos.x, y=pos.y + 0.5, z=pos.z}, node.name)
				return
			end
		end
	end
	return old_add_node(pos, node)
end

local function get_front_positions(pos, dir)
	if dir == 0 then     return { {x=pos.x, y=pos.y, z=pos.z+1}, {x=pos.x, y=pos.y, z=pos.z+2}, {x=pos.x, y=pos.y, z=pos.z+3} }
	elseif dir == 1 then return { {x=pos.x+1, y=pos.y, z=pos.z}, {x=pos.x+2, y=pos.y, z=pos.z}, {x=pos.x+3, y=pos.y, z=pos.z} }
	elseif dir == 2 then return { {x=pos.x, y=pos.y, z=pos.z-1}, {x=pos.x, y=pos.y, z=pos.z-2}, {x=pos.x, y=pos.y, z=pos.z-3} }
	elseif dir == 3 then return { {x=pos.x-1, y=pos.y, z=pos.z}, {x=pos.x-2, y=pos.y, z=pos.z}, {x=pos.x-3, y=pos.y, z=pos.z} }
	end
	return {}
end

local selection_lowered = {
	type = "fixed",
	fixed = {
		{-1.5, -0.5, -0.75, 1.5, -0.25, 3.75},
	},
}

local selection_raised = {
	type = "fixed",
	fixed = {
		{-1.5, -0.5, -0.875, 1.5, 4.0, -0.75},
	},
}

-- =========
-- Materials
-- =========

local variants = {
	{ suffix = "_acacia",    desc = "Acacia",          texture = "bridge_acacia.png^bridge_bindings_overlay.png" },
	{ suffix = "_aspen",     desc = "Aspen",           texture = "bridge_aspen.png^bridge_bindings_overlay.png" },
	{ suffix = "_jungle",    desc = "Junglewood",      texture = "bridge_junglewood.png^bridge_bindings_overlay.png" },
	{ suffix = "_pine",      desc = "Pine",            texture = "bridge_pine.png^bridge_bindings_overlay.png" },
	{ suffix = "_wood",      desc = "Wood",            texture = "bridge_wood.png^bridge_bindings_overlay.png" },
	{ suffix = "_old_oak",   desc = "Old Oak",         texture = "bridge_old_oak.png" },
}

for _, v in ipairs(variants) do
	local p = "drawbridge:drawbridge" .. v.suffix

	minetest.register_node(p, {
		description = v.desc .. " Drawbridge",
		drawtype = "mesh",
		mesh = "drawbridge.obj",
		tiles = {v.texture},
		use_texture_alpha = "clip",
		drop = p,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		walkable = true,
		selection_box = selection_lowered,
		collision_box =
			{ type = "fixed",
				fixed = {{-1.5, -0.5, -0.75, 1.5, -0.375, 1.5}}
			},
		groups = {choppy=2, wood=1, oddly_breakable_by_hand=3, flammable=3},
		sounds = default.node_sound_wood_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			local node = minetest.get_node(pos)
			local targets = get_front_positions(pos, node.param2)
			for _, t_pos in ipairs(targets) do
				minetest.set_node(t_pos, {name = "drawbridge:bridge_collision_helper"})
			end
		end,

		on_rightclick = function(pos, node, puncher)
			local param2 = node.param2
			local targets = get_front_positions(pos, param2)
			for _, t_pos in ipairs(targets) do minetest.remove_node(t_pos) end

			minetest.sound_play("castle_features_crank", {pos = pos, gain = 1.0, max_hear_distance = 32})
			minetest.swap_node(pos, {name = p .. "_20", param2 = param2})

			minetest.after(0.2, function()
				if minetest.get_node(pos).name == p .. "_20" then
					minetest.swap_node(pos, {name = p .. "_half", param2 = param2})

					minetest.after(0.2, function()
						if minetest.get_node(pos).name == p .. "_half" then
							minetest.swap_node(pos, {name = p .. "_70", param2 = param2})

							minetest.after(0.2, function()
								if minetest.get_node(pos).name == p .. "_70" then
									minetest.swap_node(pos, {name = p .. "_raised", param2 = param2})
								end
							end)
						end
					end)
				end
			end)
		end,

		after_dig_node = function(pos, oldnode, oldmetadata, digger)
			local targets = get_front_positions(pos, oldnode.param2)
			for _, t_pos in ipairs(targets) do minetest.remove_node(t_pos) end
		end,
	})

	minetest.register_node(p .. "_raised", {
		description = v.desc .. " Drawbridge Raised",
		drawtype = "mesh",
		mesh = "drawbridge_raised.obj",
		tiles = {v.texture},
		drop = p,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		selection_box = selection_raised,
		collision_box =
			{ type = "fixed",
				fixed = {{-1.5, -0.5, -0.75, 1.5, 1.5, -0.375}}
			},
		groups = {choppy=2, wood=1, oddly_breakable_by_hand=3, flammable=3, not_in_creative_inventory=1},
		sounds = default.node_sound_wood_defaults(),

		on_rightclick = function(pos, node, puncher)
			local param2 = node.param2
			minetest.sound_play("castle_features_crank", {pos = pos, gain = 1.0, max_hear_distance = 32})
			minetest.swap_node(pos, {name = p .. "_70", param2 = param2})

			minetest.after(0.2, function()
				if minetest.get_node(pos).name == p .. "_70" then
					minetest.swap_node(pos, {name = p .. "_half", param2 = param2})

					minetest.after(0.2, function()
						if minetest.get_node(pos).name == p .. "_half" then
							minetest.swap_node(pos, {name = p .. "_20", param2 = param2})

							minetest.after(0.2, function()
								if minetest.get_node(pos).name == p .. "_20" then
									minetest.swap_node(pos, {name = p, param2 = param2})
									local targets = get_front_positions(pos, param2)
									for _, t_pos in ipairs(targets) do
										minetest.set_node(t_pos, {name = "drawbridge:bridge_collision_helper"})
									end
								end
							end)
						end
					end)
				end
			end)
		end,
	})

	minetest.register_node(p .. "_20", {
		drawtype = "mesh",
		mesh = "drawbridge_20.obj",
		tiles = {v.texture},
		drop = p,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		selection_box = selection_lowered,
		collision_box =
			{ type = "fixed",
				fixed = {{0, 0, 0, 0, 0, 0}}
			},
		groups = {choppy=2, wood=1, not_in_creative_inventory=1}
	})
	minetest.register_node(p .. "_half", {
		drawtype = "mesh",
		mesh = "drawbridge_half.obj",
		tiles = {v.texture},
		drop = p,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		selection_box = selection_lowered,
		collision_box =
			{ type = "fixed",
				fixed = {{0, 0, 0, 0, 0, 0}}
			},
		groups = {choppy=2, wood=1, not_in_creative_inventory=1}
	})
	minetest.register_node(p .. "_70", {
		drawtype = "mesh",
		mesh = "drawbridge_70.obj",
		tiles = {v.texture},
		drop = p,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		selection_box = selection_lowered,
		collision_box =
			{ type = "fixed",
				fixed = {{0, 0, 0, 0, 0, 0}}
			},
		groups = {choppy=2, wood=1, not_in_creative_inventory=1}
	})
end

local lever_box = {
	type = "fixed",
	fixed = { {-0.2, -0.5, -0.2, 0.2, -0.2, 0.2} },
}


-- =========
-- The Lever
-- =========

minetest.register_node("drawbridge:gate_lever_down", {
	description = "Gate Lever",
	drawtype = "mesh",
	mesh = "gate_lever_up.obj",
	tiles = {"default_tin_block.png", "default_junglewood.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = false,
	selection_box = lever_box,
	collision_box = lever_box,
	groups = {choppy=2, oddly_breakable_by_hand=3},
	sounds = default.node_sound_wood_defaults(),

	on_rightclick = function(pos, node, clicker)
		local item = clicker:get_wielded_item():get_name()

		if item == "default:steel_ingot" then
			local positions = minetest.find_nodes_in_area(
				{x = pos.x - 15, y = pos.y - 15, z = pos.z - 15},
				{x = pos.x + 15, y = pos.y + 15, z = pos.z + 15},
				{"group:wood"}
			)

			local target = nil
			for _, p_found in ipairs(positions) do
				local n_found = minetest.get_node(p_found)
				if string.find(n_found.name, "^drawbridge:drawbridge") then
					target = p_found
					break
				end
			end

			if target then
				local meta = minetest.get_meta(pos)
				meta:set_int("bridge_x", target.x)
				meta:set_int("bridge_y", target.y)
				meta:set_int("bridge_z", target.z)
				minetest.chat_send_player(clicker:get_player_name(), "Lever linked successfully to Drawbridge!")
			else
				minetest.chat_send_player(clicker:get_player_name(), "No nearby drawbridge found within a 15-block radius.")
			end
			return
		end

		local meta = minetest.get_meta(pos)
		local bx = meta:get_int("bridge_x")
		local by = meta:get_int("bridge_y")
		local bz = meta:get_int("bridge_z")

		if bx and by and bz then
			local b_pos = {x = bx, y = by, z = bz}
			local b_node = minetest.get_node(b_pos)

			minetest.sound_play("lever_click", {pos = pos, gain = 0.3, max_hear_distance = 16})
			minetest.sound_play("drawbridge", {pos = pos, gain = 0.2, max_hear_distance = 16})

			minetest.swap_node(pos, {name = "drawbridge:gate_lever_up", param2 = node.param2})
			local new_meta = minetest.get_meta(pos)
			new_meta:set_int("bridge_x", bx)
			new_meta:set_int("bridge_y", by)
			new_meta:set_int("bridge_z", bz)

			local b_def = minetest.registered_nodes[b_node.name]
			if b_def and b_def.on_rightclick then
				b_def.on_rightclick(b_pos, b_node, clicker)
			end
		else
			minetest.chat_send_player(clicker:get_player_name(), "This lever is not linked. Right-click with a Steel Ingot near a bridge.")
		end
	end,
})

minetest.register_node("drawbridge:gate_lever_up", {
	description = "Gate Lever Up",
	drawtype = "mesh",
	mesh = "gate_lever_down.obj",
	tiles = {"default_tin_block.png", "default_junglewood.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = false,
	selection_box = lever_box,
	collision_box = lever_box,
	groups = {choppy=2, oddly_breakable_by_hand=3, not_in_creative_inventory=1},
	sounds = default.node_sound_wood_defaults(),
	drop = "drawbridge:gate_lever_down",

	on_rightclick = function(pos, node, clicker)
		local item = clicker:get_wielded_item():get_name()

		if item == "default:steel_ingot" then
			local positions = minetest.find_nodes_in_area(
				{x = pos.x - 15, y = pos.y - 15, z = pos.z - 15},
				{x = pos.x + 15, y = pos.y + 15, z = pos.z + 15},
				{"group:wood"}
			)

			local target = nil
			for _, p_found in ipairs(positions) do
				local n_found = minetest.get_node(p_found)
				if string.find(n_found.name, "^drawbridge:drawbridge") then
					target = p_found
					break
				end
			end

			if target then
				local meta = minetest.get_meta(pos)
				meta:set_int("bridge_x", target.x)
				meta:set_int("bridge_y", target.y)
				meta:set_int("bridge_z", target.z)
				minetest.chat_send_player(clicker:get_player_name(), "Lever linked successfully to Drawbridge!")
			else
				minetest.chat_send_player(clicker:get_player_name(), "No nearby drawbridge found within a 15-block radius.")
			end
			return
		end

		local meta = minetest.get_meta(pos)
		local bx = meta:get_int("bridge_x")
		local by = meta:get_int("bridge_y")
		local bz = meta:get_int("bridge_z")

		if bx and by and bz then
			local b_pos = {x = bx, y = by, z = bz}
			local b_node = minetest.get_node(b_pos)

			minetest.sound_play("lever_click", {pos = pos, gain = 0.3, max_hear_distance = 16})
			minetest.sound_play("drawbridge", {pos = pos, gain = 0.2, max_hear_distance = 16})

			minetest.swap_node(pos, {name = "drawbridge:gate_lever_down", param2 = node.param2})
			local new_meta = minetest.get_meta(pos)
			new_meta:set_int("bridge_x", bx)
			new_meta:set_int("bridge_y", by)
			new_meta:set_int("bridge_z", bz)

			local b_def = minetest.registered_nodes[b_node.name]
			if b_def and b_def.on_rightclick then
				b_def.on_rightclick(b_pos, b_node, clicker)
			end
		end
	end,
})


-- =====
-- Craft
-- =====

minetest.register_craft({
	output = "drawbridge:drawbridge",
	recipe = {
		{"default:wood", "default:steel_ingot", "default:wood"},
		{"default:wood", "default:steel_ingot", "default:wood"},
		{"default:wood", "default:wood",       "default:wood"},
	}
})

minetest.register_craft({
	output = "drawbridge:drawbridge_jungle",
	recipe = {
		{"default:junglewood", "default:steel_ingot", "default:junglewood"},
		{"default:junglewood", "default:steel_ingot", "default:junglewood"},
		{"default:junglewood", "default:junglewood", "default:junglewood"},
	}
})

minetest.register_craft({
	output = "drawbridge:gate_lever_down",
	recipe = {
		{"",                 "default:stick",       ""},
		{"group:wood",       "default:steel_ingot", "group:wood"},
		{"default:stone",    "default:stone",       "default:stone"},
	}
})
