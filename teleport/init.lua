minetest.register_node("teleport:pad", {
    description = "pad",
    tiles = "Teleport_cubo.png", 
    is_ground_content = false,
    stack_max = 64,
    groups = {cracky = 3},
    drop = "teleport:pad", 

    after_place_node = function ()
      local player = minetest.get_player_by_name("singleplayer")
      local stack = ItemStack ("teleport: command")
      
      local meta = stack:get_meta() 
      
      meta:set_int("x", pos.x)
      meta:set_int("y", pos.y)
      meta:set_int("z", pos.z)
      
      local inv = player:get_inventory()
      local imeta = inv:get_meta()
      
      imeta:set_int("x", meta:get_int("x"))
      imeta:set_int("y", meta:get_int("y"))
      imeta:set_int("z", meta:get_int("z"))
    end
  })

minetest.register_craftitem("teleport:command", {
    description = "Command", 
    inventory_image = {"Mando_lado_superior.png",
                       "Mando_lado_superior.png",
                       "Mando_lado.png",
                       "Mando_lado.png",
                       "Mando_frente.png",
                       "Mando_frente.png",
      }, 
    
    on_use = function()
      local player = minetest.get_player_by_name("singleplayer")
      local meta = stack:get_meta()
      local pmeta = player:get_meta()
      
      pmeta:set_int("x", meta:get_int("x"))
      pmeta:set_int("y", meta:get_int("y"))
      pmeta:set_int("z", meta:get_int("z"))
    end
  })










    