minetest.register_craftitem("teleport:command", {
    description = "Command",
    inventory_image = "Mando_inventory.png",
    on_use = function(item)
        local meta = item:get_meta()
        local pos = {["y"] = meta:get_int("y")+1, ["x"] = meta:get_int("x"), ["z"] = meta:get_int("z")}
        local player = minetest.get_player_by_name("singleplayer")
        player:set_pos(pos)
    end
})

minetest.register_node("teleport:pad", {
  description = "Teleporter",
  tiles = {"Teleport_cubo.png"},
  is_ground_content = false,
  stack_max = 64,
  groups = {
      cracky = 3
  },
  drop = "teleport:pad",

  after_place_node = function(pos)
      local player = minetest.get_player_by_name("singleplayer")
      local stack = ItemStack("teleport:command 1")
      local meta = stack:get_meta()

      meta:set_int("x", pos.x)
      meta:set_int("y", pos.y)
      meta:set_int("z", pos.z)

      local inv = player:get_inventory()
      inv:add_item("main", stack)
  end
})