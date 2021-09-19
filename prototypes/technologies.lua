require("items.recipes")
data:extend(
{
		
		{
		type = "technology",
		name = "spidertron-mk1",
		mod = "grid_of_inventory",
		icon_size = 256, icon_mipmaps = 4,
		icon = "__base__/graphics/technology/spidertron.png",
		effects ={
			{
				type="unlock-recipe",
				recipe="spidertron-mk1"
			}
			
		},
		
		prerequisites = {"spidertron"},
		unit =
		{
			count = 800,
			ingredients =
			{
				{"automation-science-pack", 2},
				{"logistic-science-pack", 2},
				{"military-science-pack", 3},
				{"chemical-science-pack", 2},
				{"production-science-pack", 2},
				{"utility-science-pack", 2}
			},
			time = 95
		}
		
		},
		{
		type = "technology",
		name = "spidertron-mk2",
		mod = "grid_of_inventory",
		icon_size = 256, icon_mipmaps = 4,
		icon = "__base__/graphics/technology/spidertron.png",
		effects ={
			{
				type="unlock-recipe",
				recipe="spidertron-mk2"
			}
			
		},
		prerequisites = {"spidertron-mk1"},
		unit =
		{
			count = 400,
			ingredients =
			{
				{"automation-science-pack", 2},
				{"logistic-science-pack", 1},
				{"military-science-pack", 3},
				{"chemical-science-pack", 1},
				{"production-science-pack", 1},
				{"utility-science-pack", 2}
			},
			time = 35
		}
		},
		{
		type = "technology",
		name = "spidertron-mk3",
		mod = "grid_of_inventory",
		icon_size = 256, icon_mipmaps = 4,
		icon = "__base__/graphics/technology/spidertron.png",
		effects ={
			{
				type="unlock-recipe",
				recipe="spidertron-mk3"
			}
			
		},
		prerequisites = {"spidertron-mk2"},
		unit =
		{
			count = 500,
			ingredients =
			{
				{"automation-science-pack", 2},
				{"logistic-science-pack", 2},
				{"military-science-pack", 3},
				{"chemical-science-pack", 2},
				{"production-science-pack", 1},
				{"utility-science-pack", 2}
			},
			time = 65
		}
		},
		{
		type = "technology",
		name = "spidertron-mk4",
		mod = "grid_of_inventory",
		icon_size = 256, icon_mipmaps = 4,
		icon = "__base__/graphics/technology/spidertron.png",
		effects ={
			{
				type="unlock-recipe",
				recipe="spidertron-mk4"
			}
			
		},
		prerequisites = {"spidertron-mk3"},
		unit =
		{
			count = 675,
			ingredients = 
			{
				{"automation-science-pack", 3},
				{"logistic-science-pack", 3},
				{"military-science-pack", 3},
				{"chemical-science-pack", 1},
				{"production-science-pack", 3},
				{"utility-science-pack", 2}
			},
			time = 90
		}
		},
		{
		type = "technology",
		name = "spidertron-mk5",
		mod = "grid_of_inventory",
		icon_size = 256, icon_mipmaps = 4,
		icon = "__base__/graphics/technology/spidertron.png",
		effects ={
			{
				type="unlock-recipe",
				recipe="spidertron-mk5"
			}
			
		},
		prerequisites = {"spidertron-mk4"},
		unit =
		{
			count = 775,
			ingredients = 
			{
				
				{"automation-science-pack", 2},
				{"logistic-science-pack", 2},
				{"military-science-pack", 3},
				{"chemical-science-pack", 1},
				{"production-science-pack", 3},
				{"utility-science-pack", 2},

				{"optimization-science-pack",2}
			},
			time = 95
		}
		},
		{
		type = "technology",
		name = "inventory-plus-1",
		mod = "grid_of_inventory",
		icons = util.technology_icon_constant_capacity("__base__/graphics/technology/toolbelt.png"),
		effects =
			{
				{
					type = "character-inventory-slots-bonus",
					modifier = 10
				}	
		},
		
		prerequisites = {"toolbelt"},
		unit =
		{
			count = 100,
			ingredients =
			{
				{"basic-tech-pack", 10},
				{"automation-science-pack", 3},
                {"logistic-science-pack", 4},
				{"chemical-science-pack", 4}
			},
			time = 90
		}
		},
		{
		type = "technology",
		name = "inventory-plus-2",
		mod = "grid_of_inventory",
		icons = util.technology_icon_constant_capacity("__base__/graphics/technology/toolbelt.png"),
		effects =
			{
				{
					type = "character-inventory-slots-bonus",
					modifier = 10
				},
				{
					type="character-health-bonus",
					modifier= 150
				}
		},
		prerequisites = {"inventory-plus-1"},
		unit =
		{
			count = 120,
			ingredients =
			{
				{"basic-tech-pack", 2},
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"chemical-science-pack", 1}
			},
			time = 30
		}
		},
		{
		type = "technology",
		name = "inventory-plus-3",
		mod = "grid_of_inventory",
		icons = util.technology_icon_constant_capacity("__base__/graphics/technology/toolbelt.png"),
		effects =
			{
				{
					type = "character-inventory-slots-bonus",
					modifier = 10
				},
				{
					type="character-health-bonus",
					modifier= 100
				}
		},
		prerequisites = {"inventory-plus-2"},
		unit =
		{
			count = 250,
			ingredients = 
			{
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
				{"chemical-science-pack", 2}
			},
			time = 30
		}
		},
		{
		type = "technology",
		name = "inventory-plus-4",
		mod = "grid_of_inventory",
		icons = util.technology_icon_constant_capacity("__base__/graphics/technology/toolbelt.png"),
		effects =
			{
				{
					type = "character-inventory-slots-bonus",
					modifier = 20
				},
				{
					type="character-health-bonus",
					modifier= 70
				}
		},
		prerequisites = {"inventory-plus-3"},
		unit =
		{
			count = 300,
			ingredients = 
			{
				{"automation-science-pack", 2},
				{"logistic-science-pack", 1},
				{"chemical-science-pack", 3},
				{"production-science-pack", 2}
			},
			time = 40
		}
		},		{
		type = "technology",
		name = "inventory-plus-5",
		mod = "grid_of_inventory",
		icons = util.technology_icon_constant_capacity("__base__/graphics/technology/toolbelt.png"),
		effects =
			{
				{
					type = "character-inventory-slots-bonus",
					modifier = 30
				},
				{
					type="character-health-bonus",
					modifier= 50
				}
		},
		prerequisites = {"inventory-plus-4"},
		unit =
		{
			count = 550,
			ingredients = 
			{
				{"automation-science-pack", 1},
				{"logistic-science-pack", 2},
				{"chemical-science-pack", 1},
				{"production-science-pack", 2}
			},
			time = 50
		}
		},
		{
		type = "technology",
		name = "inventory-plus-6",
		mod = "grid_of_inventory",
		icons = util.technology_icon_constant_capacity("__base__/graphics/technology/toolbelt.png"),
		effects =
			{
				{
					type = "character-inventory-slots-bonus",
					modifier = 60
				},
				{
					type="character-health-bonus",
					modifier= 30
				}
		},
		prerequisites = {"inventory-plus-5"},
		unit =
		{
			count = 700,
			ingredients = 
			{
				{"production-science-pack", 3},
				{"utility-science-pack", 1},
				{"matter-science-pack", 2},
				{"advanced-science-pack", 2}
			},
			time = 65
		}
		},
		{
		type = "technology",
		name = "inventory-plus-7",
		mod = "grid_of_inventory",
		icons = util.technology_icon_constant_capacity("__base__/graphics/technology/toolbelt.png"),
		effects =
			{
				{
					type = "character-inventory-slots-bonus",
					modifier = 90
				},
				{
					type="character-health-bonus",
					modifier= 150
				}
		},
		prerequisites = {"inventory-plus-6"},
		unit =
		{
			count = 1000,
			ingredients = 
			{
				{"production-science-pack", 2},
				{"utility-science-pack", 1},
				{"space-science-pack", 1},
				{"matter-science-pack", 3},
				{"advanced-science-pack", 2},
				{"singularity-science-pack", 2}		
			},
			time = 80
		}
		},
		{
		type = "technology",
		name = "inventory-plus-6",
		mod = "grid_of_inventory",
		icons = util.technology_icon_constant_capacity("__base__/graphics/technology/toolbelt.png"),
		effects =
			{
				{
					type = "character-inventory-slots-bonus",
					modifier = 60
				},
				{
					type="character-health-bonus",
					modifier= 30
				}
		},
		prerequisites = {"inventory-plus-5"},
		unit =
		{
			count = 700,
			ingredients = 
			{
				{"production-science-pack", 3},
				{"utility-science-pack", 1},
				{"matter-science-pack", 2},
				{"advanced-science-pack", 2}
			},
			time = 65
		}
		},
		{
			type = "technology",
			name = "speed-of-crafting-1",
			mod = "grid_of_inventory",
			icons={
				{
					icon ="__grid_of_inventory__/icons/inserter-parts.png",
					icon_size = 128
				}
			},
			effects =
				{
					{
						type="character-crafting-speed",
						modifier=0.5
					}
			},
			prerequisites = {"steel-axe"},
			unit =
			{
				count = 120,
				ingredients = 
				{
					{"basic-tech-pack",1},
					{"automation-science-pack", 1}
				},
				time = 10
			}
		},
				{
			type = "technology",
			name = "speed-of-crafting-2",
			mod = "grid_of_inventory",
			icons={
				{
					icon ="__grid_of_inventory__/icons/inserter-parts.png",
					icon_size = 128
				}
			},
			effects =
				{
					{
						type="character-crafting-speed",
						modifier=1.2
					}
			},
			prerequisites = {"speed-of-crafting-1"},
			unit =
			{
				count = 220,
				ingredients = 
				{
					{"basic-tech-pack",1},
					{"automation-science-pack", 1}
				},
				time = 20
			}
		},
				{
			type = "technology",
			name = "speed-of-crafting-3",
			mod = "grid_of_inventory",
			icons={
				{
					icon ="__grid_of_inventory__/icons/inserter-parts.png",
					icon_size = 128
				}
			},
			effects =
				{
					{
						type="character-crafting-speed",
						modifier=1.8
					}
			},
			prerequisites = {"speed-of-crafting-2"},
			unit =
			{
				count = 320,
				ingredients = 
				{
					{"basic-tech-pack",1},
					{"automation-science-pack", 1}
				},
				time = 35
			}
		},
						{
			type = "technology",
			name = "speed-of-crafting-3",
			mod = "grid_of_inventory",
			icons={
				{
					icon ="__grid_of_inventory__/icons/inserter-parts.png",
					icon_size = 128
				}
			},
			effects =
				{
					{
						type="character-crafting-speed",
						modifier=1.8
					}
			},
			prerequisites = {"speed-of-crafting-2"},
			unit =
			{
				count = 420,
				ingredients = 
				{
					{"basic-tech-pack",1},
					{"automation-science-pack", 1}
				},
				time = 45
			}
		},
			{
			type = "technology",
			name = "speed-of-crafting-4",
			mod = "grid_of_inventory",
			icons={
				{
					icon ="__grid_of_inventory__/icons/inserter-parts.png",
					icon_size = 128
				}
			},
			effects =
				{
					{
						type="character-crafting-speed",
						modifier=2.2
					}
			},
			prerequisites = {"speed-of-crafting-3"},
			unit =
			{
				count = 520,
				ingredients = 
				{
					{"basic-tech-pack",1},
					{"automation-science-pack", 1}
				},
				time = 55
			}
		},
		{
			type = "technology",
			name = "speed-of-crafting-5",
			mod = "grid_of_inventory",
			icons={
				{
					icon ="__grid_of_inventory__/icons/inserter-parts.png",
					icon_size = 128
				}
			},
			effects =
				{
					{
						type="character-crafting-speed",
						modifier=2.8
					}
			},
			prerequisites = {"speed-of-crafting-4"},
			unit =
			{
				count = 620,
				ingredients = 
				{
					{"basic-tech-pack",1},
					{"automation-science-pack", 2},
					{"logistic-science-pack",2}
				},
				time = 65
			}
		},
		{
			type = "technology",
			name = "speed-of-crafting-6",
			mod = "grid_of_inventory",
			icons={
				{
					icon ="__grid_of_inventory__/icons/inserter-parts.png",
					icon_size = 128
				}
			},
			effects =
				{
					{
						type="character-crafting-speed",
						modifier=3.2
					}
			},
			prerequisites = {"speed-of-crafting-5"},
			unit =
			{
				count = 720,
				ingredients = 
				{
					{"basic-tech-pack",2},
					{"automation-science-pack", 2},
					{"logistic-science-pack",2},
					{"chemical-science-pack",1}
				},
				time = 75
			}
		},
		{
			type = "technology",
			name = "speed-of-crafting-7",
			mod = "grid_of_inventory",
			icons={
				{
					icon ="__grid_of_inventory__/icons/inserter-parts.png",
					icon_size = 128
				}
			},
			effects =
				{
					{
						type="character-crafting-speed",
						modifier=4.2
					}
			},
			prerequisites = {"speed-of-crafting-6"},
			unit =
			{
				count = 820,
				ingredients = 
				{
					{"basic-tech-pack",2},
					{"automation-science-pack", 2},
					{"logistic-science-pack",2},
					{"chemical-science-pack",2}
				},
				time = 75
			}
		},
		{
			type = "technology",
			name = "speed-of-crafting-8",
			mod = "grid_of_inventory",
			icons={
				{
					icon ="__grid_of_inventory__/icons/inserter-parts.png",
					icon_size = 128
				}
			},
			effects =
				{
					{
						type="character-crafting-speed",
						modifier=10
					}
			},
			prerequisites = {"speed-of-crafting-7"},
			unit =
			{
				count = 820,
				ingredients = 
				{
					{"basic-tech-pack",2},
					{"automation-science-pack", 2},
					{"logistic-science-pack",2},
					{"chemical-science-pack",2},
					{"production-science-pack",3}
				},
				time = 75
			}
		},
		{
			type = "technology",
			name = "speed-of-crafting-9",
			mod = "grid_of_inventory",
			icons={
				{
					icon ="__grid_of_inventory__/icons/inserter-parts.png",
					icon_size = 128
				}
			},
			effects =
				{
					{
						type="character-crafting-speed",
						modifier=15.6
					}
			},
			prerequisites = {"speed-of-crafting-8"},
			unit =
			{
				count = 940,
				ingredients = 
				{
					{"basic-tech-pack",3},
					{"automation-science-pack", 3},
					{"logistic-science-pack",2},
					{"chemical-science-pack",2},
					{"production-science-pack",3},
					{"utility-science-pack",3}
				},
				time = 75
			}
		},
		{
			type = "technology",
			name = "speed-of-crafting-10",
			mod = "grid_of_inventory",
			icons={
				{
					icon ="__grid_of_inventory__/icons/inserter-parts.png",
					icon_size = 128
				}
			},
			effects =
				{
					{
						type="character-crafting-speed",
						modifier=5.6
					}
			},
			prerequisites = {"speed-of-crafting-9"},
			unit =
			{
				count = 1050,
				ingredients = 
				{
					{"basic-tech-pack",3},
					{"automation-science-pack", 3},
					{"logistic-science-pack",2},
					{"chemical-science-pack",2},
					{"production-science-pack",3},
					{"utility-science-pack",3}
				},
				time = 75
			}
		},
		{
			type = "technology",
			name = "speed-of-crafting-11",
			mod = "grid_of_inventory",
			icons={
				{
					icon ="__grid_of_inventory__/icons/inserter-parts.png",
					icon_size = 128
				}
			},
			effects =
				{
					{
						type="character-crafting-speed",
						modifier=20
					}
			},
			prerequisites = {"speed-of-crafting-10"},
			unit =
			{
				count = 980,
				ingredients = 
				{
					{"basic-tech-pack",3},
					{"automation-science-pack", 3},
					{"logistic-science-pack",2},
					{"chemical-science-pack",2},
					{"production-science-pack",3},
					{"utility-science-pack",3},
					{"space-science-pack",3}
				},
				time = 75
			},
			max_level=20
		},
		{
			type = "technology",
			name = "slots-trash-character-1",
			mod = "grid_of_inventory",
			icons = {
				{
				icon=("__grid_of_inventory__/icons/trash.png"),
				icon_size=128
				}
			},
			effects =
				{
					{
						type="character-logistic-trash-slots",
						modifier=5
					}
			},
			prerequisites = {"logistic-robotics"},
			unit =
			{
				count = 150,
				ingredients = 
				{
					{"basic-tech-pack",1},
					{"automation-science-pack", 1},
					{"logistic-science-pack",1},
					{"chemical-science-pack",1}
				},
				time = 15
			}
		},
		{
			type = "technology",
			name = "slots-trash-character-2",
			mod = "grid_of_inventory",
			icons = {
				{
				icon=("__grid_of_inventory__/icons/trash.png"),
				icon_size=128
				}
			},
			effects =
				{
					{
						type="character-logistic-trash-slots",
						modifier=5
					}
			},
			prerequisites = {"slots-trash-character-1"},
			unit =
			{
				count = 150,
				ingredients = 
				{
					{"basic-tech-pack",2},
					{"automation-science-pack", 1},
					{"logistic-science-pack",1},
					{"chemical-science-pack",1}
				},
				time = 20
			}
		},
				{
			type = "technology",
			name = "slots-trash-character-3",
			mod = "grid_of_inventory",
			icons = {
				{
				icon=("__grid_of_inventory__/icons/trash.png"),
				icon_size=128
				}
			},
			effects =
				{
					{
						type="character-logistic-trash-slots",
						modifier=5
					}
			},
			prerequisites = {"slots-trash-character-2"},
			unit =
			{
				count = 170,
				ingredients = 
				{
					{"basic-tech-pack",2},
					{"automation-science-pack", 2},
					{"logistic-science-pack",1},
					{"chemical-science-pack",1}
				},
				time = 25
			}
		},
		{
			type = "technology",
			name = "slots-trash-character-4",
			mod = "grid_of_inventory",
			icons = {
				{
				icon=("__grid_of_inventory__/icons/trash.png"),
				icon_size=128
				}
			},
			effects =
				{
					{
						type="character-logistic-trash-slots",
						modifier=5
					}
			},
			prerequisites = {"slots-trash-character-3"},
			unit =
			{
				count = 180,
				ingredients = 
				{
					{"basic-tech-pack",2},
					{"automation-science-pack", 2},
					{"logistic-science-pack",2},
					{"chemical-science-pack",1}
				},
				time = 25
			}
		},
		{
			type = "technology",
			name = "slots-trash-character-5",
			mod = "grid_of_inventory",
			icons = {
				{
				icon=("__grid_of_inventory__/icons/trash.png"),
				icon_size=128
				}
			},
			effects =
				{
					{
						type="character-logistic-trash-slots",
						modifier=10
					}
			},
			prerequisites = {"slots-trash-character-4"},
			unit =
			{
				count = 280,
				ingredients = 
				{
					{"basic-tech-pack",2},
					{"automation-science-pack", 2},
					{"logistic-science-pack",2},
					{"chemical-science-pack",2}
				},
				time = 30
			}
		},
		{
			type = "technology",
			name = "slots-trash-character-6",
			mod = "grid_of_inventory",
			icons = {
				{
				icon=("__grid_of_inventory__/icons/trash.png"),
				icon_size=128
				}
			},
			effects =
				{
					{
						type="character-logistic-trash-slots",
						modifier=5
					}
			},
			prerequisites = {"slots-trash-character-5"},
			unit =
			{
				count = 290,
				ingredients = 
				{
					{"basic-tech-pack",2},
					{"automation-science-pack", 3},
					{"logistic-science-pack",2},
					{"chemical-science-pack",2}
				},
				time = 40
			}
		},
				{
			type = "technology",
			name = "slots-trash-character-7",
			mod = "grid_of_inventory",
			icons = {
				{
				icon=("__grid_of_inventory__/icons/trash.png"),
				icon_size=128
				}
			},
			effects =
				{
					{
						type="character-logistic-trash-slots",
						modifier=5
					}
			},
			prerequisites = {"slots-trash-character-6"},
			unit =
			{
				count = 320,
				ingredients = 
				{
					{"basic-tech-pack",2},
					{"automation-science-pack", 3},
					{"logistic-science-pack",4},
					{"chemical-science-pack",2}
				},
				time = 50
			}
		},
				{
			type = "technology",
			name = "slots-trash-character-8",
			mod = "grid_of_inventory",
			icons = {
				{
				icon=("__grid_of_inventory__/icons/trash.png"),
				icon_size=128
				}
			},
			effects =
				{
					{
						type="character-logistic-trash-slots",
						modifier=5
					}
			},
			prerequisites = {"slots-trash-character-7"},
			unit =
			{
				count = 350,
				ingredients = 
				{
					{"basic-tech-pack",2},
					{"automation-science-pack", 3},
					{"logistic-science-pack",4},
					{"chemical-science-pack",2},
					{"military-science-pack",2}
				},
				time = 55
			}
		},
						{
			type = "technology",
			name = "slots-trash-character-9",
			mod = "grid_of_inventory",
			icons = {
				{
				icon=("__grid_of_inventory__/icons/trash.png"),
				icon_size=128
				}
			},
			effects =
				{
					{
						type="character-logistic-trash-slots",
						modifier=5
					}
			},
			prerequisites = {"slots-trash-character-8"},
			unit =
			{
				count = 380,
				ingredients = 
				{
					{"basic-tech-pack",4},
					{"automation-science-pack", 3},
					{"logistic-science-pack",4},
					{"chemical-science-pack",2},
					{"military-science-pack",3}
				},
				time = 60
			}
		},
			{
			type = "technology",
			name = "slots-trash-character-10",
			mod = "grid_of_inventory",
			icons = {
				{
				icon=("__grid_of_inventory__/icons/trash.png"),
				icon_size=128
				}
			}
			,
			effects =
				{
					{
						type="character-logistic-trash-slots",
						modifier=10
					}
			},
			prerequisites = {"slots-trash-character-9"},
			unit =
			{
				count = 980,
				ingredients = 
				{
					{"basic-tech-pack",4},
					{"automation-science-pack", 3},
					{"logistic-science-pack",4},
					{"chemical-science-pack",2},
					{"military-science-pack",3},
					{"utility-science-pack",2}
				},
				time = 80
			},
			max_level=20
		},
------------------------------------------------ROBOTS-STORAGE--------------------------------------------
			{
			type = "technology",
			name = "worker-robots-storage-4",
			mod = "grid_of_inventory",
			icon_size = 256, icon_mipmaps = 4,
			icons = util.technology_icon_constant_capacity("__base__/graphics/technology/worker-robots-storage.png"),
			effects =
				{
					{
						type="worker-robot-storage",
						modifier=1
					}
			},
			prerequisites = {"worker-robots-storage-3"},
			unit =
			{
				count = 580,
				ingredients = 
				{
					{"automation-science-pack",1},
					{"logistic-science-pack", 1},
					{"chemical-science-pack",1},
					{"production-science-pack",1},
					{"utility-science-pack",1}
				},
				time = 60
			},
		},
					{
			type = "technology",
			name = "worker-robots-storage-5",
			mod = "grid_of_inventory",
			icon_size = 256, icon_mipmaps = 4,
			icons = util.technology_icon_constant_capacity("__base__/graphics/technology/worker-robots-storage.png"),
			effects =
				{
					{
						type="worker-robot-storage",
						modifier=1
					}
			},
			prerequisites = {"worker-robots-storage-4"},
			unit =
			{
				count = 650,
				ingredients = 
				{
					{"automation-science-pack",2},
					{"logistic-science-pack", 1},
					{"chemical-science-pack",1},
					{"production-science-pack",1},
					{"utility-science-pack",1}
				},
				time = 65
			},
		},
							{
			type = "technology",
			name = "worker-robots-storage-6",
			mod = "grid_of_inventory",
			icon_size = 256, icon_mipmaps = 4,
			icons = util.technology_icon_constant_capacity("__base__/graphics/technology/worker-robots-storage.png"),
			effects =
				{
					{
						type="worker-robot-storage",
						modifier=1
					}
			},
			prerequisites = {"worker-robots-storage-5"},
			unit =
			{
				count = 700,
				ingredients = 
				{
					{"automation-science-pack",2},
					{"logistic-science-pack", 2},
					{"chemical-science-pack",1},
					{"production-science-pack",1},
					{"utility-science-pack",1}
				},
				time = 70
			},
		},
			{
			type = "technology",
			name = "worker-robots-storage-7",
			mod = "grid_of_inventory",
			icon_size = 256, icon_mipmaps = 4,
			icons = util.technology_icon_constant_capacity("__base__/graphics/technology/worker-robots-storage.png"),
			effects =
				{
					{
						type="worker-robot-storage",
						modifier=1
					}
			},
			prerequisites = {"worker-robots-storage-6"},
			unit =
			{
				count = 815,
				ingredients = 
				{
					{"automation-science-pack",2},
					{"logistic-science-pack", 2},
					{"chemical-science-pack",2},
					{"production-science-pack",1},
					{"utility-science-pack",1}
				},
				time = 75
			},
		},
		{
			type = "technology",
			name = "worker-robots-storage-8",
			mod = "grid_of_inventory",
			icon_size = 256, icon_mipmaps = 4,
			icons = util.technology_icon_constant_capacity("__base__/graphics/technology/worker-robots-storage.png"),
			effects =
				{
					{
						type="worker-robot-storage",
						modifier=1
					}
			},
			prerequisites = {"worker-robots-storage-7"},
			unit =
			{
				count = 950,
				ingredients = 
				{
					{"automation-science-pack",2},
					{"logistic-science-pack", 2},
					{"chemical-science-pack",2},
					{"production-science-pack",2},
					{"utility-science-pack",1}
				},
				time = 80
			},
		},
		{
			type = "technology",
			name = "worker-robots-storage-9",
			mod = "grid_of_inventory",
			icon_size = 256, icon_mipmaps = 4,
			icons = util.technology_icon_constant_capacity("__base__/graphics/technology/worker-robots-storage.png"),
			effects =
				{
					{
						type="worker-robot-storage",
						modifier=1
					}
			},
			prerequisites = {"worker-robots-storage-8"},
			unit =
			{
				count = 1005,
				ingredients = 
				{
					{"automation-science-pack",2},
					{"logistic-science-pack", 2},
					{"chemical-science-pack",2},
					{"production-science-pack",2},
					{"utility-science-pack",2}
				},
				time = 90
			},
		},
		{
			type = "technology",
			name = "worker-robots-storage-10",
			mod = "grid_of_inventory",
			icon_size = 256, icon_mipmaps = 4,
			icons = util.technology_icon_constant_capacity("__base__/graphics/technology/worker-robots-storage.png"),
			effects =
				{
					{
						type="worker-robot-storage",
						modifier=2
					}
			},
			prerequisites = {"worker-robots-storage-9"},
			unit =
			{
				count = 1225,
				ingredients = 
				{
					{"automation-science-pack",3},
					{"logistic-science-pack", 2},
					{"chemical-science-pack",2},
					{"production-science-pack",2},
					{"utility-science-pack",2}
				},
				time = 120
			},
			max_level=20
		},

})