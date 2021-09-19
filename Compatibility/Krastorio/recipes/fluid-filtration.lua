if mods["Krastorio2"] then
	data:extend(
	{
		{
			type = "recipe",
			name = "radioactive-water-decontamination",
			category = "fluid-filtration",
			icons =
			{
				{
					icon      = data.raw.fluid["radioactive-water"].icon,
					icon_size = data.raw.fluid["radioactive-water"].icon_size
				}
			},
			icon_size = data.raw.fluid["radioactive-water"].icon_size,
			energy_required = 9,
			emissions_multiplier=2.5,
			enabled = false,
			allow_as_intermediate = false,
			always_show_made_in = true,
			always_show_products = true,
			ingredients =
			{
				{type = "fluid", name = "radioactive-water", amount = 300, catalyst_amount = 500},
			},
			results =
			{
				{type = "fluid", name = "water", amount = 225, catalyst_amount = 250},
			},
			crafting_machine_tint =
			{
				primary = {r = 0, g = 1, b = 0.15, a = 0.95}, --dirty
				secondary = {r = 0, g = 0, b = 1, a = 0.9} --clear
			},
			subgroup = "raw-material",
			order = "w013[dirty-water-filtration-3]"
		}
	})
end