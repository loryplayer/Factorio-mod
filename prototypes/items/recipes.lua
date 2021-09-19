require("items")
require("spidertron")
data:extend(
{
	{
		type = "recipe",
		name = "spidertron-mk1",
		energy_required = 3.5,
		enabled = false,
		allow_productivity = true,
		ingredients =
		{
			{"steel-plate", 250},
			{"rocket-control-unit",10},
			{"low-density-structure",100},
			{"effectivity-module-3",5},
			{"exoskeleton-equipment",2},
			{"radar",2},
			{"spidertron",1}
		},
		result = "spidertron-mk1",
		result_count = 1
	},
		{
		type = "recipe",
		name = "spidertron-mk2",
		energy_required = 3.5,
		enabled = false,
		allow_productivity = true,
		ingredients =
		{
			{"steel-plate", 250},
			{"rocket-control-unit",10},
			{"low-density-structure",100},
			{"effectivity-module-3",5},
			{"exoskeleton-equipment",2},
			{"radar",2},
			{"spidertron-mk1",1}
		},
		result = "spidertron-mk2",
		result_count = 1
	},
		{
		type = "recipe",
		name = "spidertron-mk3",
		energy_required = 3.5,
		enabled = false,
		allow_productivity = true,
		ingredients =
		{
			{"steel-plate", 250},
			{"rocket-control-unit",10},
			{"low-density-structure",100},
			{"effectivity-module-3",5},
			{"exoskeleton-equipment",2},
			{"radar",2},
			{"spidertron-mk2",1}
		},
		result = "spidertron-mk3",
		result_count = 1
	},
		{
		type = "recipe",
		name = "spidertron-mk4",
		energy_required = 3.5,
		enabled = false,
		allow_productivity = true,
		ingredients =
		{
			{"steel-plate", 250},
			{"rocket-control-unit",10},
			{"low-density-structure",100},
			{"effectivity-module-3",5},
			{"exoskeleton-equipment",2},
			{"radar",2},
			{"spidertron-mk3",1}
		},
		result = "spidertron-mk4",
		result_count = 1
	},
		{
		type = "recipe",
		name = "spidertron-mk5",
		energy_required = 3.5,
		enabled = false,
		allow_productivity = true,
		ingredients =
		{
			{"steel-plate", 250},
			{"rocket-control-unit",10},
			{"low-density-structure",100},
			{"effectivity-module-3",5},
			{"exoskeleton-equipment",2},
			{"radar",2},
			{"spidertron-mk4",1}
		},
		result = "spidertron-mk5",
		result_count = 1
	}
})