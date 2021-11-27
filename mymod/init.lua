minetest.register_craftitem("mymod:aleks_dropeo", {
    description = "My Item",
    inventory_image = "orichalcum_fragmento.png",
    stack_max = 64,
})

minetest.register_node("mymod:aleks", {
    description = "My node", 
    tiles = {"bloque_aleks.png"}, --bloque_aleks.png
    is_ground_content = true, --si no se genera en cuevas, cambiarlo
    stack_max = 64,
    groups = {cracky = 3}, --cracky = tiempo que tarda en romper el cubo
    drop = "mymod:aleks_dropeo",
  })


minetest.register_craftitem("mymod:aleks_ingot", {
    description = "My Item",
    inventory_image = "orichalcum_lingote.png", 
    stack_max = 64,
})

minetest.register_craft({ 
    type = "cooking",
    cooktime = 13, --burntime
    output = "mymod: aleks_ingot",
    recipe = "mymod:aleks_dropeo",
  })

minetest.register_tool ("mymod:aleks_pico", {
    description = "My Tool",
    inventory_image = "orichalcum_pico.png", 
    tool_capabilities = {
      full_punch_interval = 0.01, --si peta cambiar esto
      max_drop_level = 1,
      stack_max = 64,
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

  minetest.register_craft({
      output = "mymod:aleks_pico",
      recipe = {
        {'mymod:aleks_ingot', 'mymod:aleks_ingot'},
          {'', 'group:stick'},
          {'', 'group:stick'},
      },
  })

minetest.register_tool ("mymod:aleks_espada", {
    description = "My Tool",
    inventory_image = "orichalcum_espada.png",
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

  minetest.register_craft({
    output = "mymod:aleks_espada",
    recipe = {
      {'mymod:aleks_ingot'},
      {'mymod:aleks_ingot'},
      {'group:stick'},
    },
})

minetest.register_tool ("mymod:aleks_pala", {
    description = "My Tool",
    inventory_image = "orichalcum_pala.png", 
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

  minetest.register_craft({
    output = "mymod:aleks_pala",
    recipe = {
      {'mymod:aleks_ingot'},
      {'group:stick'},
      {'group:stick'},
    },
})

minetest.register_tool ("mymod:aleks_hacha", {
    description = "My Tool",
    inventory_image = "orichalcum_hacha.png", 
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

  minetest.register_craft({
    output = "mymod:aleks_hacha",
    recipe = {
      {'mymod:aleks_ingot', 'mymod:aleks_ingot'},
      {'mymod:aleks_ingot', 'group:stick'},
      {'', 'group:stick'},
    },
})

minetest.register_ore({
    ore_type = "scatter",
    ore = "mymod:aleks",
    wherein = "default:stone",
    clust_scarcity = 9 * 9 * 9,
    clust_num_ores = 14,
    clust_size = 4,
    y_max = 31000,
    y_min = -100
})

--si son items del mod se pone mymod:cosa, si no se pone default:cosa o lo que sea
