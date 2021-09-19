if mods["Krastorio2"] then
	data:extend(
	{
		{
			type = "technology",
			name = "kr-radioactive-ore-recycling",
			icon = "__grid_of_inventory__/icons/ore-recycling.png",
			icon_size = 128,
			effects =
			{
				{
					type = "unlock-recipe",
					recipe = "radioactive-iron-ore-recycle"
				},
				{
					type = "unlock-recipe",
					recipe = "radioactive-stone-recycle"
				},
				{
					type = "unlock-recipe",
					recipe = "radioactive-water-recycle"
				},
				{
					type = "unlock-recipe",
					recipe = "radioactive-water-decontamination"
				}
			},
			prerequisites = {"uranium-processing"},
			unit =
			{
				count = 500,
				ingredients = 
				{
						{"automation-science-pack", 1},
						{"logistic-science-pack",1},
						{"chemical-science-pack",2},
						{"production-science-pack",1}
				},
				time = 45
			}
		},
		{
			type = "technology",
			name = "kr-dt-cell-recycling",
			icons={
				{
					icon      = "__grid_of_inventory__/icons/ore-recycling.png",
					icon_size = 128
				},
				{
					icon      = data.raw.item["empty-dt-fuel"].icon,
					icon_size =	data.raw.item["empty-dt-fuel"].icon_size,
					scale = 0.20 * (128*2/data.raw.item["empty-dt-fuel"].icon_size),
					shift = {0, 4}
				}
			},
			effects =
			{
				{
					type = "unlock-recipe",
					recipe = "empty-dt-fuel-recycle"
				},
				{
					type = "unlock-recipe",
					recipe = "heavy-radioactive-water-recycle"
				}
			},
			prerequisites = {"kr-radioactive-ore-recycling"},
			unit =
			{
				count = 850,
				ingredients = 
				{
						{"automation-science-pack", 3},
						{"logistic-science-pack",1},
						{"chemical-science-pack",2},
						{"production-science-pack",1}
				},
				time = 65
			}
		}
	})
end