minetest.register_node("rot: dirt", 
  {description = "dirt",
   tiles = "rot_cube.png",
   is_ground_content = true,
   groups = {cracky = 3},
 })


minetest.register_abm({
    nodenames = "default:dirt",
    interval = 10.0,
    chance = 1,
    catch_up = false,
    action = function (pos, node, active_object_count, active_object_count_wider)
      local pos = {x = pos.x,  y = pos.y, z = pos.z}
      minetest.set_node(pos, {name = "rot: dirt"})
  })

minetest.register_abm({
    nodenames = "rot: dirt",
    interval = 5.0,
    chance = 1,
    catch_up = false,
    action = function (pos, node, active_object_count, active_object_count_wider)
      local pos = {x = pos.x + 1,  y = pos.y, z = pos.z}
      minetest.set_node(pos, {name = "rot: dirt"})
    
  })

minetest.register_abm({
  nodenames = "rot: dirt",
    interval = 20.0,
    chance = 1,
    catch_up = false,
    action = function (pos, node, active_object_count, active_object_count_wider)
      local pos = {x = pos.x,  y = pos.y, z = pos.z}
      minetest.set_node(pos, {name = "default : air"})
  
  })
