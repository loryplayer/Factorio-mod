if mods["Krastorio2"] then
data:extend({
	{
		type = "virtual-signal",
		name = "kr-antimatter",
		icon = "__grid_of_inventory__/icons/antimatter.png",
		icon_size = 64,
		subgroup = "kr-special-signals",
		order = "a[special-signals]-5[nuclear-2]"
	}
})
end