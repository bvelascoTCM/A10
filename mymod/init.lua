minetest.register_node("mymod:cubonejo", {
    description = "My node", 
    tiles = {"mymod_cubonejo.png"}, --imagen que definira el cubo (la imagen del conejo se repite en cada cara)
    groups = {cracky = 3} --cracky = tiempo que tarda en romper el cubo
  })
minetest.register_craftitem("mymod:cubonejo", {
    description = "My Item",
    inventory_image = "mymod_cubonejo.png"
})

minetest.register_craft({ --revisalo
    output = "mymod:cubonejo",
    recipe = {
      {"default:string", "default:string"},
      {"default:string", "default:string"},
      {"default:string", "default:string"}
    }
  })
      



--si son items del mod se pone mymod:cosa, si no se pone default:cosa o lo que sea
