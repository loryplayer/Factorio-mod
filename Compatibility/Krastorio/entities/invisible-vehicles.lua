if mods["Krastorio2"] then
	data:extend(
	{  
		{
		  type = "car",
		  name = "kr-shelter-seat",
		  collision_mask = {"not-colliding-with-itself"},
		  collision_box = { { -0.4, -0.05 }, { 0.4, 0.05 } },
		  collision_mask = {"not-colliding-with-itself"},
		  has_belt_immunity = true,
		  animation = {
			layers = {
			  {
				animation_speed = 1,
				direction_count = 1,
				filename = "__grid_of_inventory__/icons/invisible-car.png",
				frame_count = 1,
				height = 1,
				width = 1
			  },
			}
		  },
		  braking_power = "200kW",
		  burner = {
			effectivity = 1,
			fuel_category = "chemical",
			fuel_inventory_size = 0,
			render_no_power_icon = false
		  },
		  consumption = "150kW",
		  effectivity = 0.5,
		  energy_per_hit_point = 1,
		  flags = { "placeable-neutral", "player-creation", "placeable-off-grid" },
		  friction = 0.9,
		  icon = kr_entities_icons_path .. "shelter.png",
		  icon_size = 64,
		  inventory_size = 0,
		  max_health = 45000,
		  open_sound = {
			filename = "__base__/sound/car-door-open.ogg",
			volume = 0.7
		  },
		  close_sound = {
			filename = "__base__/sound/car-door-close.ogg",
			volume = 0.7
		  },
		  render_layer = "object",
		  rotation_speed = 0.00,
		  order = "zz",
		  selectable_in_game = selectable,
		  minimap_representation={
		  filename="__grid_of_inventory__/icons/invisible-car.png",
		  size=64
		  },
		  weight = 700,
	  },
	})
end