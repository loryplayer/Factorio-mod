if mods["Krastorio2"] then
data:extend({
	{
		type     = "sound",
		name     = "kr-antimatter",
		category = "alert",
		filename = "__grid_of_inventory__/sounds/antimatter.ogg",
		volume   =5,
		audible_distance_modifier = 2.0,
		aggregation =
		{
			max_count             = 1,
			remove                = true,
			count_already_playing = true
		}
	}
})
end