if mods["Krastorio2"] then
	data:extend(
	{	
		{
			type = "recipe",
			name = "empty-dt-fuel-recycle",
			category = "chemistry",
			energy_required = 6,
			enabled = false,
			always_show_made_in = true,
			always_show_products = true,
			allow_productivity = true,
			hide_from_player_crafting=true,
			icons =
			{
				{
					icon      = "__grid_of_inventory__/icons/ore-recycling.png",
					icon_size = 128
				},
				{
					icon      = data.raw.item["empty-dt-fuel"].icon,
					icon_size =	data.raw.item["empty-dt-fuel"].icon_size,
					scale = 0.20 * (128/data.raw.item["empty-dt-fuel"].icon_size),
					shift = {0, 4}
				}
			},
			ingredients =
			{
				{type="fluid", name="heavy-water", amount=150, catalyst_amount = 100},
				{type="item", name="radioactive-empty-dt-fuel", amount=1}
			},
			results = 
			{
				{type="item", name="empty-dt-fuel", amount=1},
				{type="fluid", name="heavy-radioactive-water", amount=100, catalyst_amount = 200},
			},
			crafting_machine_tint = 
			{
				primary = {r = 0.800, g = 0.776, b = 0.313, a = 0.000},
				secondary = {r = 0.200, g = 0.680, b = 0.300, a = 0.350},
				tertiary = {r = 0.430, g = 0.305, b = 0.2, a = 0.750}, 
				quaternary = {r = 0.800, g = 0.776, b = 0.313, a = 0.900}
			},
			subgroup = "raw-material",
			order = "zb[fusion]"
		},
		{
			type = "recipe",
			name = "radioactive-iron-ore-recycle",
			emissions_multiplier=2,
			category = "chemistry",
			energy_required = 2,
			enabled = false,
			always_show_made_in = true,
			always_show_products = true,
			allow_productivity = true,
			hide_from_player_crafting=true,
			icons =
			{
				{
					icon      = data.raw.fluid["water"].icon,
					icon_size = data.raw.fluid["water"].icon_size
				},
				{
					icon      = data.raw.item["iron-ore"].icon,
					icon_size =	data.raw.item["iron-ore"].icon_size,
					scale = 0.20 * (data.raw.fluid["water"].icon_size/data.raw.item["iron-ore"].icon_size),
					shift = {0, 4}
				}
			},
			ingredients =
			{
				{type="fluid", name="water", amount=500, catalyst_amount = 250},
				{type="item", name="radioactive-iron-ore", amount=1}
			},
			results =
			{ 
				{type="fluid", name="radioactive-water", amount=300,catalyst_amount = 50},
				{type="item", name="iron-ore", amount=1}
			},
			crafting_machine_tint = 
			{
				primary = {r = 0.800, g = 0.776, b = 0.313, a = 0.000},
				secondary = {r = 0.200, g = 0.680, b = 0.300, a = 0.350},
				tertiary = {r = 0.430, g = 0.305, b = 0.2, a = 0.750}, 
				quaternary = {r = 0.800, g = 0.776, b = 0.313, a = 0.900}
			},
			subgroup = "raw-material"
		},
		{
			type = "recipe",
			name = "radioactive-stone-recycle",
			emissions_multiplier=2,
			category = "chemistry",
			energy_required = 2,
			enabled = false,
			always_show_made_in = true,
			always_show_products = true,
			allow_productivity = true,
			hide_from_player_crafting=true,
			icons={
				{
					icon      = data.raw.fluid["water"].icon,
					icon_size = data.raw.fluid["water"].icon_size
				},
				{
					icon      = data.raw.item["stone"].icon,
					icon_size =	data.raw.item["stone"].icon_size,
					scale = 0.20 * (data.raw.fluid["water"].icon_size/data.raw.item["stone"].icon_size),
					shift = {0, 4}
				}
			},
			ingredients =
			{
				{type="fluid", name="water", amount=500, catalyst_amount = 150},
				{type="item", name="radioactive-stone", amount=1}
			},
			results =--			{type = "item",  name = "uranium-235", probability = 0.002, amount = 1},
							--{type = "item",  name = "radioactive-stone", probability = 0.1, amount = 2}
			{ 
				{type="item", name="stone", amount=1},
				{type="fluid", name="radioactive-water", amount=450,catalyst_amount = 100}
			},
			crafting_machine_tint = 
			{
				primary = {r = 0.800, g = 0.776, b = 0.313, a = 0.000},
				secondary = {r = 0.200, g = 0.680, b = 0.300, a = 0.350},
				tertiary = {r = 0.430, g = 0.305, b = 0.2, a = 0.750}, 
				quaternary = {r = 0.800, g = 0.776, b = 0.313, a = 0.900}
			},
			subgroup = "raw-material"
		},
		{
			type = "recipe",
			name = "radioactive-water-recycle",
			emissions_multiplier=2,
			category = "chemistry",
			energy_required = 10.2,
			enabled = false,
			always_show_made_in = true,
			always_show_products = true,
			allow_productivity = true,
			hide_from_player_crafting=true,
			icons={
				{
					icon      = data.raw.fluid["radioactive-water"].icon,
					icon_size = data.raw.fluid["radioactive-water"].icon_size
				},
				{
					icon      = data.raw.item["uranium-235"].icon,
					icon_size =	data.raw.item["uranium-235"].icon_size,
					scale = 0.20 * (data.raw.fluid["radioactive-water"].icon_size/data.raw.item["uranium-235"].icon_size),
					shift = {0, 4}
				}
			},
			ingredients =
			{
				{type="fluid", name="radioactive-water", amount=300, catalyst_amount = 850}
			},
			results =
			{ 
				{type = "item",  name = "uranium-235", probability = 0.002, amount = 2},
				{type = "item",  name = "radioactive-stone", probability = 0.1, amount = 5},
				{type="fluid", name="radioactive-water", amount=100, catalyst_amount = 820}
			},
			crafting_machine_tint = 
			{
				primary = {r = 0.800, g = 0.776, b = 0.313, a = 0.000},
				secondary = {r = 0.200, g = 0.680, b = 0.300, a = 0.350},
				tertiary = {r = 0.430, g = 0.305, b = 0.2, a = 0.750}, 
				quaternary = {r = 0.800, g = 0.776, b = 0.313, a = 0.900}
			},
			subgroup = "raw-material"
		},
		{
			type = "recipe",
			name = "heavy-radioactive-water-recycle",
			emissions_multiplier=2,
			category = "chemistry",
			energy_required = 10.2,
			enabled = false,
			always_show_made_in = true,
			always_show_products = true,
			allow_productivity = true,
			hide_from_player_crafting=true,
			icons={
				{
					icon      = data.raw.fluid["heavy-radioactive-water"].icon,
					icon_size = data.raw.fluid["heavy-radioactive-water"].icon_size
				},
				{
					icon      = data.raw.item["tritium"].icon,
					icon_size =	data.raw.item["tritium"].icon_size,
					scale = 0.20 * (data.raw.fluid["heavy-radioactive-water"].icon_size*2/data.raw.item["tritium"].icon_size),
					shift = {0, 5}
				}
			},
			ingredients =
			{
				{type="fluid", name="heavy-radioactive-water", amount=150, catalyst_amount = 850}
			},
			results =
			{ 
				{type = "item",  name = "tritium", probability = 0.05, amount = 3},
				{type="fluid", name="radioactive-water", amount=100, catalyst_amount = 820}
			},
			crafting_machine_tint = 
			{
				primary = {r = 0.800, g = 0.776, b = 0.313, a = 0.000},
				secondary = {r = 0.200, g = 0.680, b = 0.300, a = 0.350},
				tertiary = {r = 0.430, g = 0.305, b = 0.2, a = 0.750}, 
				quaternary = {r = 0.800, g = 0.776, b = 0.313, a = 0.900}
			},
			subgroup = "raw-material",
		}
	})
	data.raw["recipe"]["uranium-processing"].results=
	{
		{type = "item",name = "uranium-235",probability = 0.012,amount = 1},
		{type="item",name = "uranium-238",probability = 0.993,amount = 2},
		{type="item",name = "radioactive-iron-ore",probability = 0.25,amount = 3},
		{type="item",name = "radioactive-stone",probability = 0.5,amount = 4}
	}
	data.raw["recipe"]["kovarex-enrichment-process"].results[2]=
	{type = "item",name = "radioactive-stone",amount = 2}
	
	data.raw["recipe"]["nuclear-fuel-reprocessing"].results[2]=
	{type = "item",name = "radioactive-stone",amount = 4}

end