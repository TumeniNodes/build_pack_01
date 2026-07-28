-- Single arch doors standalone mod for Minetest Game
-- Copyright (c) 2015-2026 TumeniNodes

single_arch_doors = {

    ["castle"] = {
        description = "Castle Single Arch Door",
        texture = "single_arch_doors_castle_door.png",
        groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
        sounds = default.node_sound_wood_defaults(),
        sound_open = "single_arch_doors_castle_door_open",
        sound_close = "single_arch_doors_castle_door_close",
        gain_open = 0.2,
        gain_close = 0.2,
        has_centered = true, 
    },

    ["dungeon"] = {
        description = "Dungeon Single Arch Door",
        texture = "single_arch_doors_dungeon_door.png",
        groups = { cracky = 1, level = 2 },
        sounds = default.node_sound_metal_defaults(),
        sound_open = "single_arch_doors_castle_door_open",
        sound_close = "single_arch_doors_castle_door_close",
        gain_open = 0.2,
        gain_close = 0.2,
        has_centered = true,
    },
}

-- Handles timed smooth multi-state door animations
local function swap_door_state(pos, mat_key, next_state, delay, final_state)
    minetest.after(delay, function()
        local current = minetest.get_node(pos)
        if string.find(current.name, "single_arch_doors:" .. mat_key .. "_door_") then
            minetest.swap_node(pos, {name = "single_arch_doors:" .. mat_key .. "_door_" .. next_state, param2 = current.param2})

            if final_state then
                swap_door_state(pos, mat_key, final_state, delay)
            end
        end
    end)
end

for mat_key, mat_def in pairs(single_arch_doors) do

    local styles = {
        {
            suffix = "",
            desc_mod = "",
            states = {
                closed = {
                    mesh = "single_arch_door.obj",
                    selection_box = {-0.5, -0.5, -0.5, 0.5, 1.5, -0.3},
                    collision_box = {-0.5, -0.5, -0.5, 0.5, 1.5, -0.3},
                    in_creative = 1,
                },
                half = {
                    mesh = "single_arch_door_half_open.obj",
                    selection_box = {0.0},
                    collision_box = {0.0},
                    in_creative = 0,
                },
                open = {
                    mesh = "single_arch_door_open.obj",
                    selection_box = {0.375, -0.5, -1.5, 0.5, 1.5, -0.5},
                    collision_box = {0.375, -0.5, -1.5, 0.5, 1.5, -0.5},
                    in_creative = 0,
                }
            }
        }
    }

    if mat_def.has_centered then
        table.insert(styles, {
            suffix = "centered_",
            desc_mod = " (Centered)",
            states = {
                closed = {
                    mesh = "single_arch_door_centered.obj",
                    selection_box = {-0.5, -0.5, -0.1, 0.5, 1.5, 0.1},
                    collision_box = {-0.5, -0.5, -0.1, 0.5, 1.5, 0.1},
                    in_creative = 1,
                },
                half = {
                    mesh = "single_arch_door_half_open_centered.obj",
                    selection_box = {0.0},
                    collision_box = {0.0},
                    in_creative = 0,
                },
                open = {
                    mesh = "single_arch_door_open_centered.obj",
                    selection_box = {0.375, -0.5, -1.0, 0.5, 1.5, 0.0},
                    collision_box = {0.375, -0.5, -1.0, 0.5, 1.5, 0.0},
                    in_creative = 0,
                }
            }
        })
    end

    for _, style in ipairs(styles) do
        for state_key, state_def in pairs(style.states) do

            local current_groups = {}
            if mat_def.groups then
                for k, v in pairs(mat_def.groups) do
                    current_groups[k] = v
                end
            end
            current_groups.door = 1
            if state_def.in_creative == 0 then
                current_groups.not_in_creative_inventory = 1
            end

            minetest.register_node("single_arch_doors:" .. mat_key .. "_door_" .. style.suffix .. state_key, {
                description = mat_def.description .. style.desc_mod,
                drawtype = "mesh",
                mesh = state_def.mesh,

                tiles = {
                    { name = mat_def.texture, backface_culling = true }
                },

                use_texture_alpha = mat_def.use_texture_alpha or "clip",
                paramtype = "light",
                paramtype2 = "facedir",
                groups = current_groups,
                sounds = mat_def.sounds,
                drop = "single_arch_doors:" .. mat_key .. "_door_" .. style.suffix .. "closed",
                selection_box = { type = "fixed", fixed = state_def.selection_box },
                collision_box = { type = "fixed", fixed = state_def.collision_box },

                on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
                    if state_key == "closed" then
                        if mat_def.sound_open then
                            minetest.sound_play(mat_def.sound_open, {pos = pos, gain = mat_def.gain_open or 0.3, max_hear_distance = 10}, true)
                        end
                        minetest.swap_node(pos, {name = "single_arch_doors:" .. mat_key .. "_door_" .. style.suffix .. "half", param2 = node.param2})
                        swap_door_state(pos, mat_key, style.suffix .. "open", 0.15)
                    elseif state_key == "open" then
                        if mat_def.sound_close then
                            minetest.sound_play(mat_def.sound_close, {pos = pos, gain = mat_def.gain_close or 0.3, max_hear_distance = 10}, true)
                        end
                        minetest.swap_node(pos, {name = "single_arch_doors:" .. mat_key .. "_door_" .. style.suffix .. "half", param2 = node.param2})
                        swap_door_state(pos, mat_key, style.suffix .. "closed", 0.15)
                    end
                end,
            })
        end
    end
end
