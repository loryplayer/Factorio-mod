if mods["Krastorio2"] then
	data:extend(
	{	
		{
			type="item",
			name="radioactive-empty-dt-fuel",
			icon =  "__grid_of_inventory__/icons/empty-dt-fuel.png",
			icon_size = 64,
			icon_mipmaps = 4,
			subgroup = "intermediate-product",
			order = "r[uranium-processing]-b1[dt-fuel]-a1[empty-dt-fuel]",
			stack_size = 10
		},
		{
			type="item",
			name="radioactive-iron-ore",
			icon = "__grid_of_inventory__/icons/radioactive-iron-ore.png",
			icon_size = 64,
			icon_mipmaps = 4,
			subgroup = "intermediate-product",
			stack_size = 200
		},
		{
			type="item",
			name="radioactive-stone",
			icon = "__grid_of_inventory__/icons/radioactive-stone.png",
			icon_size = 64,
			icon_mipmaps = 4,
			subgroup = "intermediate-product",
			stack_size = 200
		}
	})
end