minetest.register_node("mymod:aleks", {
    description = "My node", 
    tiles = {"bloque_aleks.jpg"}, --imagen que definira el cubo (la imagen del conejo se repite en cada cara)
    is_ground_content = true, --si no se genera en cuevas, cambiarlo
    groups = {cracky = 3}, --cracky = tiempo que tarda en romper el cubo
    drop = "mymod:aleks_dropeo",
  })
minetest.register_craftitem("mymod:aleks_dropeo", {
    description = "My Item",
    inventory_image = "", --poner una
})

minetest.registrer_craftitem("mymod:aleks_ingot", {
    description = "My Item",
    inventory_image = "" --poner una

minetest.register_craft({ --revisalo
    type = "cooking",
    output = "mymod: aleks_ingot",
    recipe = "default:coalblock",
    cooktime = 13, --burntime
  })

minetest.register_tool ("mymod:aleks_pico", {
    description = "My Tool",
    inventory_image = "", --poner una
    tool_capabilities = {
      full_punch_interval = 0.01, --si peta cambiar esto
      max_drop_level = 1,
      groupcaps = {
        cracky = {
          maxlevel = 2,
          uses = 100,
          times = {[1] = 1, [2] = 0.30, [3] = 0.15}
        },
      },
      damage_groups = {fleshy = 2},
      sound = {breaks = "default_tool_breaks"},
      groups = {pickaxe = 1}
    },
  })

minetest.register_tool ("mymod:aleks_espada", {
    description = "My Tool",
    inventory_image = "", --poner una
    tool_capabilities = {
      full_punch_interval = 0.01, --si peta cambiar esto
      max_drop_level = 1,
      groupcaps = {
        snappy = {
          maxlevel = 2,
          uses = 100,
          times = {[1] = 1, [2] = 0.30, [3] = 0.15}
        },
      },
      damage_groups = {fleshy = 2},
      sound = {breaks = "default_tool_breaks"},
      groups = {sword = 6}
    },
  })

minetest.register_tool ("mymod:aleks_pala", {
    description = "My Tool",
    inventory_image = "", --poner una
    tool_capabilities = {
      full_punch_interval = 0.01, --si peta cambiar esto
      max_drop_level = 1,
      groupcaps = {
        crumbly = {
          maxlevel = 2,
          uses = 100,
          times = {[1] = 1, [2] = 0.30, [3] = 0.15}
        },
      },
      damage_groups = {fleshy = 2},
      sound = {breaks = "default_tool_breaks"},
      groups = {shovel = 1}
    },
  })

minetest.register_tool ("mymod:aleks_hacha", {
    description = "My Tool",
    inventory_image = "", --poner una
    tool_capabilities = {
      full_punch_interval = 0.01, --si peta cambiar esto
      max_drop_level = 1,
      groupcaps = {
        choppy = {
          maxlevel = 2,
          uses = 100,
          times = {[1] = 1, [2] = 0.30, [3] = 0.15}
        },
      },
      damage_groups = {fleshy = 2},
      sound = {breaks = "default_tool_breaks"},
      groups = {axe = 1}
    },
  })

minetest.register_ore(
  --mirar lo del blob y stratum
  
  
  
  
  )
          
      
      
      


      



--si son items del mod se pone mymod:cosa, si no se pone default:cosa o lo que sea
