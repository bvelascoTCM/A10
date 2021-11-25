minetest.register_node("teleport:pad", {
    description = "pad",
    tiles = "", --completar
    is_ground_content = false,
    stack_max = 64,
    groups = {cracky = 3},
    drop = "teleport:pad", --que cuando lo rompas dropee el pad ????
    
    on_punch = function (pos, node, player, pointed_thing)
      local player = minetest.get_player_by_name("singleplayer")
      
  })

minetest.register_craftitem("teleport:command", {
    description = "Command", 
    inventory_image = "", --completar
  })










    