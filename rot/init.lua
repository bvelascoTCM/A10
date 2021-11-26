local c_dirt = minetest.get_content_id("default:dirt")
local c_rot_dirt = minetest.get_content_id("rot:dirt")

function delete_block_top(pos)
  pos.y = pos.y + 1
  minetest.remove_node(pos)
end


minetest.register_node("rot: dirt", 
  {description = "dirt",
   tiles = "rot_cube.png",
   is_ground_content = true,
   groups = {cracky = 3},
 })

minetest.register_node("rot: purgator", 
  {description = "purgator",
   tiles = "", --maybe necesitamos la textura de la dirt
   is_ground_content = true, --maybe quitar esta vaina
   groups = {cracky = 3} --y esto también
  })

  

minetest.register_abm({
    nodenames = "default:dirt",
    neighbors = "rot:dirt",
    interval = 10.0,
    chance = 1,
    catch_up = false,
    action = function (pos, node, active_object_count, active_object_count_wider)
      local pos = {x = pos.x,  y = pos.y, z = pos.z}
      minetest.set_node(pos, {name = "rot: dirt"})
      delete_block_top(pos)
  })

minetest.register_abm({
    nodenames = "rot: dirt",
    neighbors = "rot: dirt",
    interval = 5.0,
    chance = 1,
    catch_up = false,
    action = function (pos, node, active_object_count, active_object_count_wider)
      local pos = {x = pos.x + 1,  y = pos.y, z = pos.z}
      minetest.set_node(pos, {name = "rot: dirt"})
      delete_block_top(pos)
  })

minetest.register_abm({
  nodenames = "rot: dirt",
  neighbors = "rot: dirt",
    interval = 20.0,
    chance = 1,
    catch_up = false,
    action = function (pos, node, active_object_count, active_object_count_wider)
      local pos = {x = pos.x,  y = pos.y, z = pos.z}
      minetest.set_node(pos, {name = "default : air"})
      delete_block_top(pos)
  
})

minetest.register_abm({
    nodenames = "rot: purgator",
    interval = 10.0,
    chance = 1,
    catch_up = false,
    purge_rotdirt(pos, size) --maybe está mal
  })


local function purge_rotdirt (pos, size)
  local vm = minetest.get_voxel_manip()
  local emin,emax = vm:read_from_map(pos) --ESTO ESTA MAL, hay que hacerlo en base a size y con una pos, NO 2
  local a = VoxelArea:new{MinEdge = emin, MaxEdge = emax}
  local data = vm:get_data()
  
  for z = pos.z do
    for y = pos.y do
      for x = pos.x do
        local vi = a:index(x, y, z)
        if data[vi] == c_rot_dirt then
          data[vi] = c_dirt
        end
      end
    end
  end
  
  vm:set_data(data)
  vm:write_to_map(true)
  
end



