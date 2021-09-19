if mods["Krastorio2"] then
	data:extend({
	{
		type = "battery-equipment",
		name = "big-battery-mk3-equipment",
		sprite =
		{
			filename = kr_universal_equipments_path .. "big-battery-mk3-equipment.png",
			width = 64,
			height = 64,
			priority = "medium",
			hr_version =
			{
				filename = kr_universal_equipments_path .. "hr-big-battery-mk3-equipment.png",		
				width    = 128,
				height   = 128,
				priority = "medium",
				scale    = 0.5
			}
		},
		shape =
		{
			width = 2,
			height = 2,
			type = "full"
		},
		energy_source =
		{
			type = "electric",
			buffer_capacity = "250MJ",
			input_flow_limit = "35MW",
			output_flow_limit = "40MW",
			usage_priority = "tertiary"
		},
		categories = {"universal-equipment"}
	},
	{
		type = "battery-equipment",
		name = "energy-absorber",
		sprite =
		{
			filename = kr_universal_equipments_path .. "energy-absorber.png",
			width = 128,
			height = 128,
			scale = 0.55,
			priority = "medium",
			hr_version =
			{
				filename = kr_universal_equipments_path .. "hr-energy-absorber.png",		
				width    = 256,
				height   = 256,
				priority = "medium",
				scale    = 0.275
			}
		},
		shape =
		{
			width = 2,
			height = 2,
			type = "full"
		},
		energy_source =
		{
			type = "electric",
			buffer_capacity = "18MJ",
			input_flow_limit = "0kW",
			output_flow_limit = "35MW",
			usage_priority = "primary-output"
		},
		categories = {"universal-equipment"}
	},
	})
end