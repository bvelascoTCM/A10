function delete_block_top(pos)
  pos.y = pos.y + 1
  minetest.remove_node(pos)
end


minetest.register_node("rot:dirt",  
  {description = "Rot",
   tiles = "Rot_cubo.png",
   is_ground_content = true,
   groups = {cracky = 3}
 })

local c_dirt = minetest.get_content_id("default:dirt")
local c_rot_dirt = minetest.get_content_id("rot:dirt")

minetest.register_node("rot:purgator", 
  {description = "Purgator",
   tiles = "Cure_cubo.png", 
   is_ground_content = false, 
   groups = {cracky = 3} 
  })

minetest.register_abm({
    nodenames = "default:dirt",
    neighbors = "rot:dirt",
    interval = 10.0,
    chance = 1,
    catch_up = false,
    action = function (pos, node, active_object_count, active_object_count_wider)
      local pos = {x = pos.x,  y = pos.y, z = pos.z}
      minetest.set_node(pos, {name = "rot:dirt"})
      delete_block_top(pos)
    end
    
  })

minetest.register_abm({
    nodenames = "rot:dirt",
    neighbors = "rot:dirt",
    interval = 5.0,
    chance = 1,
    catch_up = false,
    action = function (pos, node, active_object_count, active_object_count_wider)
      local pos = {x = pos.x + 1,  y = pos.y, z = pos.z}
      minetest.set_node(pos, {name = "rot:dirt"})
      delete_block_top(pos)
    end
    
  })

minetest.register_abm({
  nodenames = "rot:dirt",
  neighbors = "rot:dirt",
    interval = 20.0,
    chance = 1,
    catch_up = false,
    action = function (pos, node, active_object_count, active_object_count_wider)
      local pos = {x = pos.x,  y = pos.y, z = pos.z}
      minetest.set_node(pos, {name = "default:air"})
      delete_block_top(pos)
    end
    
  
})

minetest.register_abm({ 
    nodenames = "rot:purgator",
    interval = 10.0,
    chance = 1,
    catch_up = false,
    action = function (pos, size) --error
      local vm = minetest.get_voxel_manip()
      local eminx,emaxx = vm:read_from_map(pos.x - size/2, pos.x + size/2) --error la x del size
      local eminy, emaxy = vm:read_from_map(pos.y - size.y/2, pos.y + size.y/2 )
      local eminz, emaxz = vm:read_from_map(pos.z - size.z/2, pos.z + size.z/2)
      local a = VoxelArea:new{MinEdge = {eminx, eminy, eminz}, MaxEdge = {emaxx, emaxy, emaxz}} --maybe esta mal
      local data = vm:get_data()
  
      for z = eminz,emaxz  do
        for y = eminy, emaxy do 
          for x = eminx, emaxx do
          local vi = a:index(x, y, z)
          if data[vi] == c_rot_dirt then
            data[vi] = c_dirt
          end
        end
      end
    end
  
    vm:set_data(data)
    vm:write_to_map(true)
  
end--maybe está mal
    
  })






