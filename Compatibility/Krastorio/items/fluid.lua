if mods["Krastorio2"] then
	data:extend({
		{
			type = "fluid",
			name = "radioactive-water",
			default_temperature = 65,
			max_temperature = 500,
			auto_barrel = true,
			base_color = {r=0.65, g=0.50, b=0.20},
			flow_color = {r=0.65, g=0.50, b=0.20},
			icon = "__grid_of_inventory__/icons/radioactive-water.png",
			icon_size = 64,
			icon_mipmaps = 4,
			order = "ya04[radioactive-water]"
		},
		{
			type = "fluid",
			name = "heavy-radioactive-water",
			default_temperature = 65,
			max_temperature = 500,
			auto_barrel = true,
			base_color = {r=0.65, g=0.50, b=0.20},
			flow_color = {r=0.65, g=0.50, b=0.20},
			icon = "__grid_of_inventory__/icons/heavy-radioactive-water.png",
			icon_size = 64,
			icon_mipmaps = 4,
			order = "ya04[radioactive-water]"
		},
		{
			type = "fluid",
			name = "heavy-water",
			default_temperature = 25,
			max_temperature = 100,
			auto_barrel = true,
			base_color = {r=0.2, g=0.3, b=0.32},
			flow_color = {r=0.5, g=0.9, b=0.6},
			icon = kr_fluids_icons_path  .. "heavy-water.png",
			icon_size = 64,
			icon_mipmaps = 4,
			order = "ya09[heavy-water]"
    }
	})
end