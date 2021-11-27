minetest.register_node("rot:dirt", {
    description = "Rot",
    tiles = {"default_dirt.png^Rot_cubo.png"},
    is_ground_content = true,
    groups = {
        cracky = 3
    },
    drop = "rot:dirt"
})

minetest.register_node("rot:purgator", {
    description = "Purgator",
    tiles = {"Cure_cubo.png"},
    is_ground_content = false,
    groups = {
        cracky = 3
    }
})

-- VIRUS GENERATE
minetest.register_abm({
    nodenames = "default:dirt_with_grass",
    interval = 10.0,
    chance = 100,
    action = function(pos)
        minetest.set_node(pos, {
            name = "rot:dirt"
        })
    end
})

-- VIRUS CONTACT 
minetest.register_abm({
    nodenames = "default:dirt_with_grass",
    neighbors = "rot:dirt",
    interval = 5,
    chance = 30,
    action = function(pos)
        minetest.set_node(pos, {
            name = "rot:dirt"
        })
    end
})

-- VIRUS DELETE
minetest.register_abm({
    nodenames = "rot:dirt",
    interval = 20.0,
    chance = 80,
    catch_up = false,
    action = function(pos)
        minetest.remove_node(pos)
    end
})

-- Purificación Fórmula
local c_poisoned = minetest.get_content_id("rot:dirt")
local c_dirt = minetest.get_content_id("default:dirt_with_grass")

function purge_rotdirt(pos, size)
    local vm = minetest.get_voxel_manip()
    local pos1 = {y = pos.y - size, x = pos.x - size, z = pos.z - size}
    local pos2 = {y = pos.y + size, x = pos.x + size, z = pos.z + size}
    local emin, emax = vm:read_from_map(pos1, pos2)
    local a = VoxelArea:new{
      MinEdge = emin,
      MaxEdge = emax
    }
    local data = vm:get_data()

    for z = pos1.z, pos2.z do
        for y = pos1.y, pos2.y do
            for x = pos1.x, pos2.x do
                local vi = a:index(x, y, z)
                if data[vi] == c_poisoned then
                    data[vi] = c_dirt
                end
            end
        end
    end

    vm:set_data(data)
    vm:write_to_map(true)
end

-- VIRUS DELETE
minetest.register_abm({
  nodenames = "rot:purgator",
  interval = 1.0,
  chance = 5,
  action = function(pos)
    purge_rotdirt(pos, 5)
  end
})