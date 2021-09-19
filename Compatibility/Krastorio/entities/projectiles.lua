if mods["Krastorio2"] then
	local sounds = require("__base__/prototypes/entity/sounds")
	data:extend({
	
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
		{
			type = "projectile",
			name = "antimatter-rocket-projectile",
			--flags = {"not-on-map"},
			reveal_map = true,
			map_color = {r=1, g=0, b=0.8},
			acceleration = 0.01,
			action =
				{
					type = "direct",
					action_delivery =
					{
						type = "instant",
						target_effects =
						{
							{
								type = "set-tile",
								tile_name = "nuclear-ground",
								radius = 15,
								apply_projection = true,
								tile_collision_mask = { "water-tile" },
							},
							{
								type = "destroy-cliffs",
								radius = 25,
								explosion = "explosion"
							},
							{
								type = "create-entity",
								entity_name = "matter-explosion"
							},
							{
								type = "camera-effect",
								effect = "screen-burn",
								duration = 240,
								ease_in_duration = 5,
								ease_out_duration = 60,
								delay = 0.9,
								strength = 12,
								full_strength_max_distance = 250,
								max_distance = 500
							},
							{
								type = "play-sound",
								sound = sounds.nuclear_explosion(0.9),
								play_on_target_position = false,
								-- min_distance = 200,
								max_distance = 2000,
								-- volume_modifier = 1,
								audible_distance_modifier = 4
							},
							{
								type = "play-sound",
								sound = sounds.nuclear_explosion_aftershock(0.4),
								play_on_target_position = false,
								-- min_distance = 200,
								max_distance = 3000,
								-- volume_modifier = 1,
								audible_distance_modifier = 4
							},
							{
								type = "damage",
								damage = {amount = 9000, type = "explosion"}
							},
							{
								type = "damage",
								damage = {amount = 10750, type = "antimatter"}
							},
							{
								type = "show-explosion-on-chart",
								scale = 100
							},
							{
								type = "create-entity",
								entity_name = "huge-scorchmark",
								check_buildability = true,
							},
							{
								type="create-entity",
								entity_name="antimatter-cloud-rocket"
							},
							{
								type = "invoke-tile-trigger",
								repeat_count = 1,
							},
							{
								type = "destroy-decoratives",
								include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
								include_decals = true,
								invoke_decorative_trigger = true,
								decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
								radius = 95 -- large radius for demostrative purposes
							},
							{
								type = "create-decorative",
								decorative = "nuclear-ground-patch",
								spawn_min_radius = 13.5,
								spawn_max_radius = 15.5,
								spawn_min = 100,
								spawn_max = 250,
								apply_projection = true,
								spread_evenly = true
							},
							{
								type = "nested-result",
								action =
								{
									type = "area",
									target_entities = false,
									trigger_from_target = true,
									repeat_count = 1100,
									radius = 85, --raggio effettivo 1
									action_delivery =
									{
										type = "projectile",
										projectile = "atomic-bomb-ground-zero-projectile",
										starting_speed = 0.25 * 0.25,
										starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
									}
								}
							},
							{
								type = "nested-result",
								action =
								{
									type = "area",
									target_entities = false,
									trigger_from_target = true,
									repeat_count = 500,
									radius = 90, --raggio effettivo 2
									action_delivery =
									{
										type = "projectile",
										projectile = "antimatter-bomb-wave-rocket",
										starting_speed = 0.5 * 0.35,
										starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
									}
								}
							},
							{
								type = "nested-result",
								action =
								{
									type = "area",
									show_in_tooltip = false,
									target_entities = false,
									trigger_from_target = true,
									repeat_count = 2050,
									radius = 155,
									action_delivery =
									{
										type = "projectile",
										projectile = "atomic-bomb-wave-spawns-cluster-nuke-explosion",
										starting_speed = 0.5 * 5,
										starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
									}
								}
							},
							{
								type = "nested-result",
								action =
								{
									type = "area",
									show_in_tooltip = false,
									target_entities = false,
									trigger_from_target = true,
									repeat_count = 4240,
									radius = 155,
									action_delivery =
									{
										type = "projectile",
										projectile = "atomic-bomb-wave-spawns-cluster-nuke-explosion",
										starting_speed = 0.5 * 4,
										starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
									}
								}
							},  
							{
								type = "nested-result",
								action =
								{
									type = "area",
									show_in_tooltip = false,
									target_entities = false,
									trigger_from_target = true,
									repeat_count = 2800,
									radius = 155,
									action_delivery =
									{
										type = "projectile",
										projectile = "atomic-bomb-wave-spawns-cluster-nuke-explosion",
										starting_speed = 0.5 * 3,
										starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
									}
								}
							},
							{
								type = "nested-result",
								action =
								{
									type = "area",
									show_in_tooltip = false,
									target_entities = false,
									trigger_from_target = true,
									repeat_count = 3000,
									radius = 155,
									action_delivery =
									{
										type = "projectile",
										projectile = "atomic-bomb-wave-spawns-cluster-nuke-explosion",
										starting_speed = 0.5 * 2,
										starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
									}
								}
							},

							{
								type = "nested-result",
								action =
									{
									type = "area",
									show_in_tooltip = false,
									target_entities = false,
									trigger_from_target = true,
									repeat_count = 1050,
									radius = 155,
									action_delivery =
									{
										type = "projectile",
										projectile = "antimatter-bomb-wave-spawns-fire-smoke-explosion",
										starting_speed = 0.5 * 0.75,
										starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
									}
								}
							},
							{
								type = "nested-result",
								action =
									{
									type = "area",
									show_in_tooltip = false,
									target_entities = false,
									trigger_from_target = true,
									repeat_count = 650,
									radius = 155,
									action_delivery =
									{
										type = "projectile",
										projectile = "antimatter-bomb-wave-spawns-matter-shockwave-explosion",
										starting_speed = 0.5 * 0.8,
										starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
									}
								}
							},
							{
								type = "nested-result",
								action =
								{
									type = "area",
									show_in_tooltip = false,
									target_entities = false,
									trigger_from_target = true,
									repeat_count = 1700,
									radius = 155,
									action_delivery =
									{
										type = "projectile",
										projectile = "antimatter-bomb-wave-spawns-matter-smoke",
										starting_speed = 0.5 * 0.78,
										starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
									}
								}
							},
							{
								type = "nested-result",
								action =
								{
									type = "area",
									show_in_tooltip = false,
									target_entities = false,
									trigger_from_target = true,
									repeat_count = 1020,
									radius = 155,
									action_delivery =
									{
										type = "instant",
										target_effects =
										{
											{
												type = "create-entity",
												entity_name = "nuclear-smouldering-smoke-source",
												tile_collision_mask = { "water-tile" }
											}
										}
									}
								}
							},
							{
								type = "create-entity",
								entity_name = "beacon-matter-explosion"
							},
							{
								type = "create-entity",
								entity_name = "beacon-matter-explosion"
							}
						}
					}
				},
				animation =
				{
					filename = "__base__/graphics/entity/rocket/rocket.png",
					frame_count = 8,
					line_length = 8,
					width = 9,
					height = 35,
					shift = {0, 0},
					priority = "high"
				},
				shadow =
				{
					filename = "__base__/graphics/entity/rocket/rocket-shadow.png",
					frame_count = 1,
					width = 7,
					height = 24,
					priority = "high",
					shift = {0, 0}
				},
				smoke =
				{
					{
						name = "smoke-fast",
						deviation = {0.15, 0.15},
						frequency = 0.5,
						position = {0, 1},
						slow_down_factor = 1,
						starting_frame = 3,
						starting_frame_deviation = 5,
						starting_frame_speed = 0,
						starting_frame_speed_deviation = 1
					}
				},
				light = {intensity = 0.5, size = 10, color = {r=0.9, g=0.1, b=1}},
			},
			
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
			
			{
		type = "projectile",
		name = "antimatter-bomb-wave-rocket",
		flags = {"not-on-map"},
		acceleration = 0,
		speed_modifier = { 1.2, 1.007 },
		action =
		{
			{
				type = "area",
				radius = 45,
				ignore_collision_condition = true,
				action_delivery =
				{
					type = "instant",
					target_effects =
					{
						type = "damage",
						vaporize = false,
						lower_distance_threshold = 0,
						upper_distance_threshold = 50,
						lower_damage_modifier = 1,
						upper_damage_modifier = 0.1,
						damage = {amount = 900, type = "explosion"}
					},
					{
						type = "damage",
						vaporize = false,
						lower_distance_threshold = 0,
						upper_distance_threshold = 50,
						lower_damage_modifier = 1,
						upper_damage_modifier = 0.25,
						damage = {amount = 2200, type = "antimatter"}
					},
					{
						type = "damage",
						vaporize = false,
						lower_distance_threshold = 0,
						upper_distance_threshold = 50,
						lower_damage_modifier = 1,
						upper_damage_modifier = 0.1,
						damage = {amount = 1200, type = "kr-explosion"}
					}	
				}
			}
		},
		animation = nil,
		shadow = nil
	},
	

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  
  {
     type = "smoke-with-trigger",
    name = "antimatter-cloud-rocket",
    flags = {"not-on-map"},
    show_when_smoke_off = true,
    particle_count = 30,
    particle_spread = { 25,15 },
    particle_distance_scale_factor = 0.2,
    particle_scale_factor = { 0.85, 0.85 },
    wave_speed = { 1/90, 1/90 },
    wave_distance = { 0.3, 0.2 },
    spread_duration_variation = 20;
    particle_duration_variation = 60 * 3;
    render_layer = "object",
    affected_by_wind = false,
    cyclic = true,
    duration = 60*160,
    fade_away_duration = 2 * 60,
    spread_duration = 20,
    color = {r = 0.75, g = 0.2, b = 0.5, a = 0.5}, -- #
    animation =
    {
      width = 152,
      height = 120,
      line_length = 5,
      frame_count = 60,
      shift = {-0.53125, -0.4375},
      priority = "high",
      animation_speed = 0.25,
      filename = "__base__/graphics/entity/smoke/smoke.png", --
      flags = { "smoke" }
    },
    created_effect =
    {
	   {
        type = "cluster",
        cluster_count = 5,
        distance = 2,
        distance_deviation = 12.5,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            type = "create-smoke",
            show_in_tooltip = false,
            entity_name = "antimatter-cloud-visual-dummy-rocket",
            initial_height = 0
          },{
                type = "damage",
                damage = { amount = 495, type = "antimatter"}
			}
        }
      },
	  {
        type = "cluster",
        cluster_count = 10,
        distance = 20,
        distance_deviation = 22.5,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            type = "create-smoke",
            show_in_tooltip = false,
            entity_name = "antimatter-cloud-visual-dummy-rocket",
            initial_height = 0
          },{
                type = "damage",
                damage = { amount = 345, type = "antimatter"}
			}
        }
      },
      {
        type = "cluster",
        cluster_count = 15,
        distance = 35,
        distance_deviation = 32.5,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            type = "create-smoke",
            show_in_tooltip = false,
            entity_name = "antimatter-cloud-visual-dummy-rocket",
            initial_height = 0
          },{
                type = "damage",
                damage = { amount = 395, type = "antimatter"}
			}
        }
      },
      {
        type = "cluster",
        cluster_count = 20,
        distance = 65,
        distance_deviation = 42.5,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            type = "create-smoke",
			 entity_name = "antimatter-cloud-visual-dummy-rocket",
            show_in_tooltip = false,
            initial_height = 0
          },{
                type = "damage",
                damage = { amount = 295, type = "antimatter"}
			}
        }
      }
    },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/fight/poison-cloud.ogg",
        volume = 0.7
      },
    },
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "nested-result",
          action =
          {
            type = "area",
            radius = 65,
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
				{
                type = "damage",
                damage = { amount = 290, type = "poison"}
				},
				{
				type = "destroy-decoratives",
				include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
				include_decals = true,
				invoke_decorative_trigger = true,
				decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
				radius = 35 -- large radius for demostrative purposes
				},
				{
				type = "create-sticker",
				sticker = "slowdown-sticker-anti"
				}
              }
            }
          }
        }
      }
    },
    action_cooldown = 30
  },
  
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  {
    type = "smoke-with-trigger",
    name = "antimatter-cloud-visual-dummy-rocket",
    flags = {"not-on-map"},
    show_when_smoke_off = true,
    particle_count = 24,
    particle_spread = {45,45},
    particle_distance_scale_factor = 1.5,
    particle_scale_factor = { 1.5, 1.5 },
    particle_duration_variation = 60 * 3;
    wave_speed = { 0.5 / 80, 0.5 / 60 },
    wave_distance = { 4, 0.5 },
    spread_duration_variation = 300 - 20;
    render_layer = "object",
    affected_by_wind = false,
    cyclic = true,
    duration = 60 * 150,
    fade_away_duration = 3 * 60,
    spread_duration = (300 - 20) / 2 ,
    color = {r = 0.6, g = 0.2, b = 0.4, a = 0.5}, -- #0
    animation =
    {
      width = 608, --152
      height = 480,
      line_length = 5,
      frame_count = 60,
      shift = {-0.53125, -0.4375},
      priority = "high",
      animation_speed = 0.25,--__grid_of_inventory__/icons/smoke.png
      filename = "__grid_of_inventory__/icons/smoke.png",
      flags = { "smoke" }
    },
	action={
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "nested-result",
          action =
          {
            type = "area",
            radius = 50,
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
				{
                type = "damage",
                damage = { amount = 1525, type = "poison"}
				},
				{
				type = "destroy-decoratives",
				include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
				include_decals = true,
				invoke_decorative_trigger = true,
				decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
				radius = 45 -- large radius for demostrative purposes
				}
              }
            }
          }
        }
		}
		}
    --working_sound =
    --{
    --  sound =
    --  {
    --    filename = "__base__/sound/fight/poison-cloud.ogg",
    --    volume = 0.5
    --  },
    --},
  },
  
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

		{
			type = "artillery-projectile",
			name = "antimatter-artillery-projectile",
			flags = {"not-on-map"},
			acceleration = 0,
			direction_only = true,
			reveal_map = true,
			map_color = {r=1, g=1, b=0},
			picture =
			{
			  filename = "__base__/graphics/entity/artillery-projectile/hr-shell.png",
			  width = 64,
			  height = 64,
			  scale = 0.5
			},
			shadow =
			{
			  filename = "__base__/graphics/entity/artillery-projectile/hr-shell-shadow.png",
			  width = 64,
			  height = 64,
			  scale = 0.5
			},
			chart_picture =
			{
			  filename = "__base__/graphics/entity/artillery-projectile/artillery-shoot-map-visualization.png",
			  flags = { "icon" },
			  frame_count = 1,
			  width = 64,
			  height = 64,
			  priority = "high",
			  scale = 0.25
			},
			action =
				{
					type = "direct",
					action_delivery =
					{
						type = "instant",
						target_effects =
						{
							{
								type = "set-tile",
								tile_name = "nuclear-ground",
								radius = 35,
								apply_projection = true,
								tile_collision_mask = { "water-tile" },
							},
							{
								type = "destroy-cliffs",
								radius = 55,
								explosion = "explosion"
							},
							{
								type = "create-entity",
								entity_name = "matter-explosion"
							},
							{
								type = "camera-effect",
								effect = "screen-burn",
								duration = 240,
								ease_in_duration = 5,
								ease_out_duration = 60,
								delay = 1.2,
								strength = 12,
								full_strength_max_distance = 250,
								max_distance = 500
							},
							{
								type = "play-sound",
								sound = sounds.nuclear_explosion(0.9),
								play_on_target_position = false,
								-- min_distance = 200,
								max_distance = 5000,
								-- volume_modifier = 1,
								audible_distance_modifier = 4
							},
							{
								type = "play-sound",
								sound = sounds.nuclear_explosion_aftershock(0.4),
								play_on_target_position = false,
								-- min_distance = 200,
								max_distance = 6000,
								-- volume_modifier = 1,
								audible_distance_modifier = 8
							},
							{
								type = "damage",
								damage = {amount = 12000, type = "explosion"}
							},
							{
								type = "damage",
								damage = {amount = 15750, type = "antimatter"}
							},
							{
								type = "show-explosion-on-chart",
								scale = 100
							},
							{
								type = "create-entity",
								entity_name = "huge-scorchmark",
								check_buildability = true,
							},
							{
								type="create-entity",
								entity_name="antimatter-cloud"
							},
							{
								type = "invoke-tile-trigger",
								repeat_count = 1,
							},
							{
								type = "destroy-decoratives",
								include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
								include_decals = true,
								invoke_decorative_trigger = true,
								decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
								radius = 95 -- large radius for demostrative purposes
							},
							{
								type = "create-decorative",
								decorative = "nuclear-ground-patch",
								spawn_min_radius = 13.5,
								spawn_max_radius = 15.5,
								spawn_min = 100,
								spawn_max = 250,
								apply_projection = true,
								spread_evenly = true
							},
							{
								type = "nested-result",
								action =
								{
									type = "area",
									target_entities = false,
									trigger_from_target = true,
									repeat_count = 1500,
									radius = 125, --raggio effettivo 1
									action_delivery =
									{
										type = "projectile",
										projectile = "atomic-bomb-ground-zero-projectile",
										starting_speed = 0.5 * 0.8,
										starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
									}
								}
							},
							{
								type = "nested-result",
								action =
								{
									type = "area",
									target_entities = false,
									trigger_from_target = true,
									repeat_count = 1900,  --800
									radius = 160, --raggio effettivo 2 --65
									action_delivery =
									{
										type = "projectile",
										projectile = "antimatter-bomb-wave",
										starting_speed = 0.5 * 0.5,
										starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
									}
								}
							},
							{
								type = "nested-result",
								action =
								{
									type = "area",
									show_in_tooltip = false,
									target_entities = false,
									trigger_from_target = true,
									repeat_count = 2850,
									radius = 235,
									action_delivery =
									{
										type = "projectile",
										projectile = "atomic-bomb-wave-spawns-cluster-nuke-explosion",
										starting_speed = 0.25 * 0.25,
										starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
									}
								}
							},
							{
								type = "nested-result",
								action =
								{
									type = "area",
									show_in_tooltip = false,
									target_entities = false,
									trigger_from_target = true,
									repeat_count = 5040,
									radius = 235,
									action_delivery =
									{
										type = "projectile",
										projectile = "atomic-bomb-wave-spawns-cluster-nuke-explosion",
										starting_speed = 0.5 * 0.8,
										starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
									}
								}
							},  
							{
								type = "nested-result",
								action =
								{
									type = "area",
									show_in_tooltip = false,
									target_entities = false,
									trigger_from_target = true,
									repeat_count = 3600,
									radius = 235,
									action_delivery =
									{
										type = "projectile",
										projectile = "atomic-bomb-wave-spawns-cluster-nuke-explosion",
										starting_speed = 0.5 * 0.8,
										starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
									}
								}
							},
							{
								type = "nested-result",
								action =
								{
									type = "area",
									show_in_tooltip = false,
									target_entities = false,
									trigger_from_target = true,
									repeat_count = 3800,
									radius = 235,
									action_delivery =
									{
										type = "projectile",
										projectile = "atomic-bomb-wave-spawns-cluster-nuke-explosion",
										starting_speed = 0.5 * 0.8,
										starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
									}
								}
							},

							{
								type = "nested-result",
								action =
									{
									type = "area",
									show_in_tooltip = false,
									target_entities = false,
									trigger_from_target = true,
									repeat_count = 1850,
									radius = 235,
									action_delivery =
									{
										type = "projectile",
										projectile = "antimatter-bomb-wave-spawns-fire-smoke-explosion",
										starting_speed = 0.5 * 0.8,
										starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
									}
								}
							},
							{
								type = "nested-result",
								action =
									{
									type = "area",
									show_in_tooltip = false,
									target_entities = false,
									trigger_from_target = true,
									repeat_count = 1450,
									radius = 165,
									action_delivery =
									{
										type = "projectile",
										projectile = "antimatter-bomb-wave-spawns-matter-shockwave-explosion",
										starting_speed = 0.5 * 0.8,
										starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
									}
								}
							},
							{
								type = "nested-result",
								action =
								{
									type = "area",
									show_in_tooltip = false,
									target_entities = false,
									trigger_from_target = true,
									repeat_count = 2500,
									radius = 235,
									action_delivery =
									{
										type = "projectile",
										projectile = "antimatter-bomb-wave-spawns-matter-smoke",
										starting_speed = 0.5 * 0.8,
										starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
									}
								}
							},
							{
								type = "nested-result",
								action =
								{
									type = "area",
									show_in_tooltip = false,
									target_entities = false,
									trigger_from_target = true,
									repeat_count = 1820,
									radius = 235,
									action_delivery =
									{
										type = "instant",
										target_effects =
										{
											{
												type = "create-entity",
												entity_name = "nuclear-smouldering-smoke-source",
												tile_collision_mask = { "water-tile" }
											}
										}
									}
								}
							},
							{
								type = "create-entity",
								entity_name = "beacon-matter-explosion"
							},
							{
								type = "create-entity",
								entity_name = "beacon-matter-explosion"
							}
						}
					}
				},
			final_action =
			{
			  type = "direct",
			  action_delivery =
			  {
				type = "instant",
				target_effects =
				{
				  {
					type = "create-entity",
					entity_name = "small-scorchmark",
					check_buildability = true
				  }
				}
			  }
			},
			animation =
			{
			  filename = "__base__/graphics/entity/bullet/bullet.png",
			  frame_count = 1,
			  width = 3,
			  height = 50,
			  priority = "high"
			},
			height_from_ground = 280 / 64
		},
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
			
		{
		type = "projectile",
		name = "antimatter-bomb-wave",
		flags = {"not-on-map"},
		acceleration = 0,
		speed_modifier = { 1.0, 0.707 },
		action =
		{
			{
				type = "area",
				radius = 80,
				ignore_collision_condition = true,
				action_delivery =
				{
					type = "instant",
					target_effects =
					{
						type = "damage",
						vaporize = false,
						lower_distance_threshold = 0,
						upper_distance_threshold = 50,
						lower_damage_modifier = 1,
						upper_damage_modifier = 0.1,
						damage = {amount = 1200, type = "explosion"}
					},
					{
						type = "damage",
						vaporize = false,
						lower_distance_threshold = 0,
						upper_distance_threshold = 50,
						lower_damage_modifier = 1,
						upper_damage_modifier = 0.25,
						damage = {amount = 2500, type = "antimatter"}
					},
					{
						type = "damage",
						vaporize = false,
						lower_distance_threshold = 0,
						upper_distance_threshold = 50,
						lower_damage_modifier = 1,
						upper_damage_modifier = 0.1,
						damage = {amount = 1500, type = "kr-explosion"}
					}	
				}
			}
		},
		animation = nil,
		shadow = nil
	},
	
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  {
     type = "smoke-with-trigger",
    name = "antimatter-cloud",
    flags = {"not-on-map"},
    show_when_smoke_off = true,
    particle_count = 40,
    particle_spread = { 85,85 },
    particle_distance_scale_factor = 0.5,
    particle_scale_factor = { 1.5, 1.5 },
    wave_speed = { 1/80, 1/60 },
    wave_distance = { 0.3, 0.2 },
    spread_duration_variation = 20;
    particle_duration_variation = 60 * 3;
    render_layer = "object",
    affected_by_wind = false,
    cyclic = true,
    duration = 60*160,
    fade_away_duration = 2 * 60,
    spread_duration = 20,
    color = {r = 0.75, g = 0.2, b = 0.5, a = 0.5}, -- #
    animation =
    {
      width = 152,
      height = 120,
      line_length = 5,
      frame_count = 60,
      shift = {-0.53125, -0.4375},
      priority = "high",
      animation_speed = 0.25,
      filename = "__base__/graphics/entity/smoke/smoke.png", --
      flags = { "smoke" }
    },
    created_effect =
    {
	
    },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/fight/poison-cloud.ogg",
        volume = 0.7
      },
    },
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
			type = "nested-result",
			action =
			{
				{
				type = "area",
				radius = 125,
				action_delivery =
					{
						type = "instant",
						target_effects =
						{
							{
							type = "damage",
							damage = { amount = 855, type = "antimatter"}
							},
							{
							type = "destroy-decoratives",
							include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
							include_decals = true,
							invoke_decorative_trigger = true,
							decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
							radius = 75 -- large radius for demostrative purposes
							},
							{
							type = "create-sticker",
							sticker = "slowdown-sticker-anti"
							}
						}
					}
				},
				{
				type = "area",
				radius = 165,
				action_delivery =
					{
						type = "instant",
						target_effects =
						{
							{
							type = "damage",
							damage = { amount = 95, type = "antimatter"}
							},
							{
							type = "destroy-decoratives",
							include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
							include_decals = true,
							invoke_decorative_trigger = true,
							decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
							radius = 75 -- large radius for demostrative purposes
							},
							{
							type = "create-sticker",
							sticker = "slowdown-sticker-anti"
							}
						}
					}
				},
          }
        }
      }
    },
    action_cooldown = 30
  },
  
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	{
    type = "smoke-with-trigger",
    name = "antimatter-cloud-visual-dummy",
    flags = {"not-on-map"},
    show_when_smoke_off = true,
    particle_count = 54,
    particle_spread = {65,65},
    particle_distance_scale_factor = 1.5,
    particle_scale_factor = { 1.5, 1.5 },
    particle_duration_variation = 60 * 3;
    wave_speed = { 0.5 / 80, 0.5 / 60 },
    wave_distance = { 4, 0.5 },
    spread_duration_variation = 300 - 20;
    render_layer = "object",
    affected_by_wind = false,
    cyclic = true,
    duration = 60 * 150,
    fade_away_duration = 3 * 60,
    spread_duration = (300 - 20) / 2 ,
    color = {r = 0.6, g = 0.2, b = 0.4, a = 0.5}, -- #0
    animation =
    {
      width = 608, --152d
      height = 480,
      line_length = 5,
      frame_count = 60,
      shift = {-0.53125, -0.4375},
      priority = "high",
      animation_speed = 0.25,
      filename = "__grid_of_inventory__/icons/smoke.png",
      flags = { "smoke" }
    },
	action={
		type = "direct",
		action_delivery =
		{
			type = "instant",
			target_effects =
			{
			type = "nested-result",
			action =
			{
				type = "area",
				radius = 100,
				action_delivery =
				{
					type = "instant",
					target_effects =
					{
						{
							type = "damage",
							damage = { amount = 1025, type = "poison"}
						},
						{
						type = "destroy-decoratives",
						include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
						include_decals = true,
						invoke_decorative_trigger = true,
						decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
						radius = 220 -- large radius for demostrative purposes
						}
					}
				}
			}
		}
		}
		}
    --working_sound =
    --{
    --  sound =
    --  {
    --    filename = "__base__/sound/fight/poison-cloud.ogg",
    --    volume = 0.5
    --  },
    --},
  },

-----------------------------------------------------------------------------------------------------------------
			{
			type = "projectile",
			name = "atomic-rocket",
			--flags = {"not-on-map"},
			reveal_map = true,
			map_color = {r=1, g=0, b=0.8},
			acceleration = 0.01,
			action =
				{
					type = "direct",
					action_delivery =
					{
						type = "instant",
						target_effects =
						{
							{
								type = "set-tile",
								tile_name = "nuclear-ground",
								radius = 15,
								apply_projection = true,
								tile_collision_mask = { "water-tile" },
							},
							{
								type = "destroy-cliffs",
								radius = 25,
								explosion = "explosion"
							},
							{
								type = "create-entity",
								entity_name = "nuke-explosion"
							},
							{
								type = "camera-effect",
								effect = "screen-burn",
								duration = 120,
								ease_in_duration = 5,
								ease_out_duration = 60,
								delay = 0.9,
								strength = 12,
								full_strength_max_distance = 250,
								max_distance = 500
							},
							{
								type = "play-sound",
								sound = sounds.nuclear_explosion(0.9),
								play_on_target_position = false,
								-- min_distance = 200,
								max_distance = 2000,
								-- volume_modifier = 1,
								audible_distance_modifier = 4
							},
							{
								type = "play-sound",
								sound = sounds.nuclear_explosion_aftershock(0.4),
								play_on_target_position = false,
								-- min_distance = 200,
								max_distance = 3000,
								-- volume_modifier = 1,
								audible_distance_modifier = 4
							},
							{
								type = "damage",
								damage = {amount = 1000, type = "explosion"}
							},
							{
								type = "damage",
								damage = {amount = 2750, type = "radioactive"}
							},
							{
								type = "show-explosion-on-chart",
								scale = 100
							},
							{
								type = "create-entity",
								entity_name = "huge-scorchmark",
								check_buildability = true,
							},
							{
								type="create-entity",
								entity_name="radioactive-cloud-rocket"
							},
							{
								type="create-entity",
								entity_name="radioactive-area-rocket"
							},
							{
								type = "invoke-tile-trigger",
								repeat_count = 1,
							},
							{
								type = "destroy-decoratives",
								include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
								include_decals = true,
								invoke_decorative_trigger = true,
								decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
								radius = 55 -- large radius for demostrative purposes
							},
							{
								type = "create-decorative",
								decorative = "nuclear-ground-patch",
								spawn_min_radius = 13.5,
								spawn_max_radius = 15.5,
								spawn_min = 100,
								spawn_max = 250,
								apply_projection = true,
								spread_evenly = true
							},
							{
								type = "nested-result",
								action =
								{
									type = "area",
									target_entities = false,
									trigger_from_target = true,
									repeat_count = 500,
									radius = 40, --raggio effettivo 1
									action_delivery =
									{
										type = "projectile",
										projectile = "atomic-bomb-ground-zero-projectile",
										starting_speed = 0.25 * 0.25,
										starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
									}
								}
							},
							{
								type = "nested-result",
								action =
								{
									type = "area",
									target_entities = false,
									trigger_from_target = true,
									repeat_count = 300,
									radius = 45, --raggio effettivo 2
									action_delivery =
									{
										type = "projectile",
										projectile = "atomic-bomb-wave-rocket",
										starting_speed = 0.5 * 0.35,
										starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
									}
								}
							},
							{
								type = "nested-result",
								action =
								{
									type = "area",
									show_in_tooltip = false,
									target_entities = false,
									trigger_from_target = true,
									repeat_count = 1050,
									radius = 40,
									action_delivery =
									{
										type = "projectile",
										projectile = "atomic-bomb-wave-spawns-cluster-nuke-explosion",
										starting_speed = 0.5 * 5,
										starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
									}
								}
							},
							{
								type = "nested-result",
								action =
								{
									type = "area",
									show_in_tooltip = false,
									target_entities = false,
									trigger_from_target = true,
									repeat_count = 2120,
									radius = 40,
									action_delivery =
									{
										type = "projectile",
										projectile = "atomic-bomb-wave-spawns-cluster-nuke-explosion",
										starting_speed = 0.5 * 4,
										starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
									}
								}
							},  
							{
								type = "nested-result",
								action =
								{
									type = "area",
									show_in_tooltip = false,
									target_entities = false,
									trigger_from_target = true,
									repeat_count = 1400,
									radius = 40,
									action_delivery =
									{
										type = "projectile",
										projectile = "atomic-bomb-wave-spawns-cluster-nuke-explosion",
										starting_speed = 0.5 * 3,
										starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
									}
								}
							},
							{
								type = "nested-result",
								action =
								{
									type = "area",
									show_in_tooltip = false,
									target_entities = false,
									trigger_from_target = true,
									repeat_count = 1500,
									radius = 40,
									action_delivery =
									{
										type = "projectile",
										projectile = "atomic-bomb-wave-spawns-nuke-shockwave-explosion",
										starting_speed = 0.5 * 2,
										starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
									}
								}
							},

							{
								type = "nested-result",
								action =
									{
									type = "area",
									show_in_tooltip = false,
									target_entities = false,
									trigger_from_target = true,
									repeat_count = 525,
									radius = 40,
									action_delivery =
									{
										type = "projectile",
										projectile = "atomic-bomb-wave-spawns-nuke-shockwave-explosion",
										starting_speed = 0.5 * 0.75,
										starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
									}
								}
							},
							{
								type = "nested-result",
								action =
									{
									type = "area",
									show_in_tooltip = false,
									target_entities = false,
									trigger_from_target = true,
									repeat_count = 325,
									radius = 40,
									action_delivery =
									{
										type = "projectile",
										projectile = "atomic-bomb-wave-spawns-nuke-shockwave-explosion",
										starting_speed = 0.5 * 0.8,
										starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
									}
								}
							},
							{
								type = "nested-result",
								action =
								{
									type = "area",
									show_in_tooltip = false,
									target_entities = false,
									trigger_from_target = true,
									repeat_count = 700,
									radius = 40,
									action_delivery =
									{
										type = "projectile",
										projectile = "atomic-bomb-wave-spawns-nuke-shockwave-explosion",
										starting_speed = 0.5 * 0.78,
										starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
									}
								}
							},
							{
								type = "nested-result",
								action =
								{
									type = "area",
									show_in_tooltip = false,
									target_entities = false,
									trigger_from_target = true,
									repeat_count = 720,
									radius = 40,
									action_delivery =
									{
										type = "instant",
										target_effects =
										{
											{
												type = "create-entity",
												entity_name = "nuclear-smouldering-smoke-source",
												tile_collision_mask = { "water-tile" }
											}
										}
									}
								}
							},
							{
								type = "create-entity",
								entity_name = "beacon-matter-explosion"
							},
							{
								type = "create-entity",
								entity_name = "beacon-matter-explosion"
							}
						}
					}
				},
				animation =
				{
					filename = "__base__/graphics/entity/rocket/rocket.png",
					frame_count = 8,
					line_length = 8,
					width = 9,
					height = 35,
					shift = {0, 0},
					priority = "high"
				},
				shadow =
				{
					filename = "__base__/graphics/entity/rocket/rocket-shadow.png",
					frame_count = 1,
					width = 7,
					height = 24,
					priority = "high",
					shift = {0, 0}
				},
				smoke =
				{
					{
						name = "smoke-fast",
						deviation = {0.15, 0.15},
						frequency = 0.5,
						position = {0, 1},
						slow_down_factor = 1,
						starting_frame = 3,
						starting_frame_deviation = 5,
						starting_frame_speed = 0,
						starting_frame_speed_deviation = 1
					}
				},
				light = {intensity = 0.5, size = 10, color = {r=0.9, g=0.1, b=1}},
			},
			
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
			
			{
		type = "projectile",
		name = "atomic-bomb-wave-rocket",
		flags = {"not-on-map"},
		acceleration = 0,
		speed_modifier = { 1.2, 1.007 },
		action =
		{
			{
				type = "area",
				radius = 40,
				ignore_collision_condition = true,
				action_delivery =
				{
					type = "instant",
					target_effects =
					{
						type = "damage",
						vaporize = false,
						lower_distance_threshold = 0,
						upper_distance_threshold = 50,
						lower_damage_modifier = 1,
						upper_damage_modifier = 0.1,
						damage = {amount = 300, type = "explosion"}
					},
					{
						type = "damage",
						vaporize = false,
						lower_distance_threshold = 0,
						upper_distance_threshold = 50,
						lower_damage_modifier = 1,
						upper_damage_modifier = 0.25,
						damage = {amount = 1200, type = "radioactive"}
					},
					{
						type = "damage",
						vaporize = false,
						lower_distance_threshold = 0,
						upper_distance_threshold = 50,
						lower_damage_modifier = 1,
						upper_damage_modifier = 0.1,
						damage = {amount = 650, type = "kr-explosion"}
					}	
				}
			}
		},
		animation = nil,
		shadow = nil
	},
	

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  
  {
     type = "smoke-with-trigger",
    name = "radioactive-cloud-rocket",
    flags = {"not-on-map"},
    show_when_smoke_off = true,
    particle_count = 30,
    particle_spread = { 15,15 },
    particle_distance_scale_factor = 0.2,
    particle_scale_factor = { 0.85, 0.85 },
    wave_speed = { 1/110, 1/110 },
    wave_distance = { 0.3, 0.2 },
    spread_duration_variation = 20;
    particle_duration_variation = 60 * 3;
    render_layer = "object",
    affected_by_wind = false,
    cyclic = true,
    duration = 60*160,
    fade_away_duration = 2 * 60,
    spread_duration = 20,
    color = {r = 0.24, g = 0.72, b = 0.09, a = 0.5}, -- #
    animation =
    {
      width = 152,
      height = 120,
      line_length = 5,
      frame_count = 60,
      shift = {-0.53125, -0.4375},
      priority = "high",
      animation_speed = 0.25,
      filename = "__base__/graphics/entity/smoke/smoke.png", --
      flags = { "smoke" }
    },
    created_effect =
    {
	   {
        type = "cluster",
        cluster_count = 5,
        distance = 2,
        distance_deviation = 2.5,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            type = "create-smoke",
            show_in_tooltip = false,
            entity_name = "radioactive-cloud-visual-dummy-rocket",
            initial_height = 0
          },{
                type = "damage",
                damage = { amount = 295, type = "radioactive"}
			}
        }
      },
	  {
        type = "cluster",
        cluster_count = 10,
        distance = 10,
        distance_deviation = 12.5,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            type = "create-smoke",
            show_in_tooltip = false,
            entity_name = "radioactive-cloud-visual-dummy-rocket",
            initial_height = 0
          },{
                type = "damage",
                damage = { amount = 165, type = "radioactive"}
			}
        }
      },
      {
        type = "cluster",
        cluster_count = 15,
        distance = 25,
        distance_deviation = 22.5,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            type = "create-smoke",
            show_in_tooltip = false,
            entity_name = "radioactive-cloud-visual-dummy-rocket",
            initial_height = 0
          },{
                type = "damage",
                damage = { amount = 135, type = "radioactive"}
			}
        }
      },
      {
        type = "cluster",
        cluster_count = 20,
        distance = 35,
        distance_deviation = 12.5,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            type = "create-smoke",
			 entity_name = "radioactive-cloud-visual-dummy-rocket",
            show_in_tooltip = false,
            initial_height = 0
          },{
                type = "damage",
                damage = { amount = 95, type = "radioactive"}
			}
        }
      }
    },
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "nested-result",
          action =
          {
            type = "area",
            radius = 45,
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
				{
                type = "damage",
                damage = { amount = 290, type = "radioactive"}
				},
				{
				type = "destroy-decoratives",
				include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
				include_decals = true,
				invoke_decorative_trigger = true,
				decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
				radius = 35 -- large radius for demostrative purposes
				},
				{
				type = "create-sticker",
				sticker = "slowdown-sticker-anti"
				}
              }
            }
          }
        }
      }
    },
    action_cooldown = 30
  },
  
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

{
    type = "smoke-with-trigger",
    name = "radioactive-area-rocket",
    flags = {"not-on-map"},
    show_when_smoke_off = true,
    particle_count = 15,
    particle_spread = {45,45},
    particle_distance_scale_factor = 1.5,
    particle_scale_factor = { 1.5, 1.5 },
    particle_duration_variation = 60 * 3;
    wave_speed = { 0.5 / 80, 0.5 / 60 },
    wave_distance = { 4, 0.5 },
    spread_duration_variation = 300 - 20;
    render_layer = "object",
    affected_by_wind = false,
    cyclic = true,
    duration = 60 * 350,
    fade_away_duration = 3 * 60,
    spread_duration = (300 - 20) / 2 ,
    color = {r = 0.24, g = 0.72, b = 0.09, a = 0}, -- #0
    animation =
    {
      width = 608, --152d
      height = 480,
      line_length = 5,
      frame_count = 60,
      shift = {-0.53125, -0.4375},
      priority = "high",
      animation_speed = 0.25,
      filename = "__grid_of_inventory__/icons/smoke.png",
      flags = { "smoke" }
    },
	created_effect=
	{
			type = "cluster",
			cluster_count = 15,
			distance = 15,
			distance_deviation = 12.5,
			action_delivery =
			{
				type = "instant",
				target_effects =
				{
					type = "create-smoke",
					entity_name = "radioactive-cloud-visual-dummy",
					show_in_tooltip = false,
					initial_height = 0
				},
				{
					type = "damage",
					damage = { amount = 195, type = "radioactive"}
				}
			}
		},
	action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
			type = "nested-result",
			action =
			{
				{
				type = "area",
				radius = 105,
				action_delivery =
					{
						type = "instant",
						target_effects =
						{
							{
							type = "damage",
							damage = { amount = 655, type = "radioactive"}
							},
							{
							type = "destroy-decoratives",
							include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
							include_decals = true,
							invoke_decorative_trigger = true,
							decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
							radius = 75 -- large radius for demostrative purposes
							},
							{
							type = "create-sticker",
							sticker = "slowdown-sticker-anti"
							}
						}
					}
				},
				{
				type = "area",
				radius = 105,
				action_delivery =
					{
						type = "instant",
						target_effects =
						{
							{
								type = "damage",
								damage = { amount = 95, type = "radioactive"}
							},
							{
								type = "destroy-decoratives",
								include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
								include_decals = true,
								invoke_decorative_trigger = true,
								decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
								radius = 75 -- large radius for demostrative purposes
							},
							{
								type = "create-sticker",
								sticker = "slowdown-sticker-anti"
							}
						}
					}
				},
          }
        }
      }
    }
    --working_sound =
    --{
    --  sound =
    --  {
    --    filename = "__base__/sound/fight/poison-cloud.ogg",
    --    volume = 0.5
    --  },
    --},
  },
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  {
    type = "smoke-with-trigger",
    name = "radioactive-cloud-visual-dummy-rocket",
    flags = {"not-on-map"},
    show_when_smoke_off = true,
    particle_count = 15,
    particle_spread = {25,25},
    particle_distance_scale_factor = 1.5,
    particle_scale_factor = { 1.5, 1.5 },
    particle_duration_variation = 60 * 3;
    wave_speed = { 0.5 / 80, 0.5 / 60 },
    wave_distance = { 4, 0.5 },
    spread_duration_variation = 300 - 20;
    render_layer = "object",
    affected_by_wind = false,
    cyclic = true,
    duration = 60 * 150,
    fade_away_duration = 3 * 60,
    spread_duration = (300 - 20) / 2 ,
    color = {r = 0.24, g = 0.72, b = 0.09, a = 0.5}, -- #0
    animation =
    {
      width = 608, --152
      height = 480,
      line_length = 5,
      frame_count = 60,
      shift = {-0.53125, -0.4375},
      priority = "high",
      animation_speed = 0.25,
      filename = "__grid_of_inventory__/icons/smoke.png",
      flags = { "smoke" }
    },
	action={
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "nested-result",
          action =
          {
            type = "area",
            radius = 20,
			entity_flags = {"breaths-air"},
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
				{
                type = "damage",
                damage = { amount = 125, type = "radioactive"}
				},
				{
				type = "destroy-decoratives",
				include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
				include_decals = true,
				invoke_decorative_trigger = true,
				decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
				radius = 15 -- large radius for demostrative purposes
				}
              }
            }
          }
        }
		}
		}
    --working_sound =
    --{
    --  sound =
    --  {
    --    filename = "__base__/sound/fight/poison-cloud.ogg",
    --    volume = 0.5
    --  },
    --},
  },
  
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

		{
			type = "artillery-projectile",
			name = "atomic-artillery",
			flags = {"not-on-map"},
			acceleration = 0,
			direction_only = true,
			reveal_map = true,
			map_color = {r=1, g=1, b=0},
			picture =
			{
			  filename = "__base__/graphics/entity/artillery-projectile/hr-shell.png",
			  width = 64,
			  height = 64,
			  scale = 0.5
			},
			shadow =
			{
			  filename = "__base__/graphics/entity/artillery-projectile/hr-shell-shadow.png",
			  width = 64,
			  height = 64,
			  scale = 0.5
			},
			chart_picture =
			{
			  filename = "__base__/graphics/entity/artillery-projectile/artillery-shoot-map-visualization.png",
			  flags = { "icon" },
			  frame_count = 1,
			  width = 64,
			  height = 64,
			  priority = "high",
			  scale = 0.25
			},
			action =
				{
					type = "direct",
					action_delivery =
					{
						type = "instant",
						target_effects =
						{
							{
								type = "set-tile",
								tile_name = "nuclear-ground",
								radius = 25,
								apply_projection = true,
								tile_collision_mask = { "water-tile" },
							},
							{
								type = "destroy-cliffs",
								radius = 35,
								explosion = "explosion"
							},
							{
								type = "create-entity",
								entity_name = "nuke-explosion"
							},
							{
								type = "camera-effect",
								effect = "screen-burn",
								duration = 200,
								ease_in_duration = 5,
								ease_out_duration = 60,
								delay = 1.2,
								strength = 12,
								full_strength_max_distance = 250,
								max_distance = 500
							},
							{
								type = "play-sound",
								sound = sounds.nuclear_explosion(0.9),
								play_on_target_position = false,
								-- min_distance = 200,
								max_distance = 5000,
								-- volume_modifier = 1,
								audible_distance_modifier = 4
							},
							{
								type = "play-sound",
								sound = sounds.nuclear_explosion_aftershock(0.4),
								play_on_target_position = false,
								-- min_distance = 200,
								max_distance = 6000,
								-- volume_modifier = 1,
								audible_distance_modifier = 8
							},
							{
								type = "damage",
								damage = {amount = 8000, type = "explosion"}
							},
							{
								type = "damage",
								damage = {amount = 9750, type = "radioactive"}
							},
							{
								type = "show-explosion-on-chart",
								scale = 100
							},
							{
								type = "create-entity",
								entity_name = "huge-scorchmark",
								check_buildability = true,
							},
							{
								type="create-entity",
								entity_name="radioactive-cloud"
							},
							{
								type="create-entity",
								entity_name="radioactive-area"
							},
							{
								type = "invoke-tile-trigger",
								repeat_count = 1,
							},
							{
								type = "destroy-decoratives",
								include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
								include_decals = true,
								invoke_decorative_trigger = true,
								decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
								radius = 55 -- large radius for demostrative purposes
							},
							{
								type = "create-decorative",
								decorative = "nuclear-ground-patch",
								spawn_min_radius = 13.5,
								spawn_max_radius = 15.5,
								spawn_min = 100,
								spawn_max = 250,
								apply_projection = true,
								spread_evenly = true
							},
							{
								type = "nested-result",
								action =
								{
									type = "area",
									target_entities = false,
									trigger_from_target = true,
									repeat_count = 1200,
									radius = 95, --raggio effettivo 1
									action_delivery =
									{
										type = "projectile",
										projectile = "atomic-bomb-ground-zero-projectile",
										starting_speed = 0.5 * 0.8,
										starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
									}
								}
							},
							{
								type = "nested-result",
								action =
								{
									type = "area",
									target_entities = false,
									trigger_from_target = true,
									repeat_count = 1350,  --800
									radius = 100, --raggio effettivo 2 --65
									action_delivery =
									{
										type = "projectile",
										projectile = "atomic-bomb-wave",
										starting_speed = 0.5 * 0.5,
										starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
									}
								}
							},
							{
								type = "nested-result",
								action =
								{
									type = "area",
									show_in_tooltip = false,
									target_entities = false,
									trigger_from_target = true,
									repeat_count = 1750,
									radius = 105,
									action_delivery =
									{
										type = "projectile",
										projectile = "atomic-bomb-wave-spawns-cluster-nuke-explosion",
										starting_speed = 0.25 * 0.25,
										starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
									}
								}
							},
							{
								type = "nested-result",
								action =
								{
									type = "area",
									show_in_tooltip = false,
									target_entities = false,
									trigger_from_target = true,
									repeat_count = 3040,
									radius = 105,
									action_delivery =
									{
										type = "projectile",
										projectile = "atomic-bomb-wave-spawns-cluster-nuke-explosion",
										starting_speed = 0.5 * 0.8,
										starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
									}
								}
							},  
							{
								type = "nested-result",
								action =
								{
									type = "area",
									show_in_tooltip = false,
									target_entities = false,
									trigger_from_target = true,
									repeat_count = 1900,
									radius = 105,
									action_delivery =
									{
										type = "projectile",
										projectile = "atomic-bomb-wave-spawns-cluster-nuke-explosion",
										starting_speed = 0.5 * 0.8,
										starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
									}
								}
							},
							{
								type = "nested-result",
								action =
								{
									type = "area",
									show_in_tooltip = false,
									target_entities = false,
									trigger_from_target = true,
									repeat_count = 2500,
									radius = 105,
									action_delivery =
									{
										type = "projectile",
										projectile = "atomic-bomb-wave-spawns-cluster-nuke-explosion",
										starting_speed = 0.5 * 0.8,
										starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
									}
								}
							},

							{
								type = "nested-result",
								action =
									{
									type = "area",
									show_in_tooltip = false,
									target_entities = false,
									trigger_from_target = true,
									repeat_count = 1250,
									radius = 105,
									action_delivery =
									{
										type = "projectile",
										projectile = "atomic-bomb-wave-spawns-nuke-shockwave-explosion",
										starting_speed = 0.5 * 0.8,
										starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
									}
								}
							},
							{
								type = "nested-result",
								action =
									{
									type = "area",
									show_in_tooltip = false,
									target_entities = false,
									trigger_from_target = true,
									repeat_count = 1150,
									radius = 105,
									action_delivery =
									{
										type = "projectile",
										projectile = "atomic-bomb-wave-spawns-nuke-shockwave-explosion",
										starting_speed = 0.5 * 0.8,
										starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
									}
								}
							},
							{
								type = "nested-result",
								action =
								{
									type = "area",
									show_in_tooltip = false,
									target_entities = false,
									trigger_from_target = true,
									repeat_count = 2200,
									radius = 105,
									action_delivery =
									{
										type = "projectile",
										projectile = "atomic-bomb-wave-spawns-nuke-shockwave-explosion",
										starting_speed = 0.5 * 0.8,
										starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
									}
								}
							},
							{
								type = "nested-result",
								action =
								{
									type = "area",
									show_in_tooltip = false,
									target_entities = false,
									trigger_from_target = true,
									repeat_count = 1120,
									radius = 105,
									action_delivery =
									{
										type = "instant",
										target_effects =
										{
											{
												type = "create-entity",
												entity_name = "nuclear-smouldering-smoke-source",
												tile_collision_mask = { "water-tile" }
											}
										}
									}
								}
							},
							{
								type = "create-entity",
								entity_name = "beacon-matter-explosion"
							},
							{
								type = "create-entity",
								entity_name = "beacon-matter-explosion"
							}
						}
					}
				},
			final_action =
			{
			  type = "direct",
			  action_delivery =
			  {
				type = "instant",
				target_effects =
				{
				  {
					type = "create-entity",
					entity_name = "small-scorchmark",
					check_buildability = true
				  }
				}
			  }
			},
			animation =
			{
			  filename = "__base__/graphics/entity/bullet/bullet.png",
			  frame_count = 1,
			  width = 3,
			  height = 50,
			  priority = "high"
			},
			height_from_ground = 280 / 64
		},
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
			
		{
		type = "projectile",
		name = "radioactive-bomb-wave",
		flags = {"not-on-map"},
		acceleration = 0,
		speed_modifier = { 1.0, 0.707 },
		action =
		{
			{
				type = "area",
				radius = 90,
				ignore_collision_condition = true,
				action_delivery =
				{
					type = "instant",
					target_effects =
					{
						type = "damage",
						vaporize = false,
						lower_distance_threshold = 0,
						upper_distance_threshold = 50,
						lower_damage_modifier = 1,
						upper_damage_modifier = 0.1,
						damage = {amount = 950, type = "explosion"}
					},
					{
						type = "damage",
						vaporize = false,
						lower_distance_threshold = 0,
						upper_distance_threshold = 50,
						lower_damage_modifier = 1,
						upper_damage_modifier = 0.25,
						damage = {amount = 1500, type = "radioactive"}
					},
					{
						type = "damage",
						vaporize = false,
						lower_distance_threshold = 0,
						upper_distance_threshold = 50,
						lower_damage_modifier = 1,
						upper_damage_modifier = 0.1,
						damage = {amount = 950, type = "kr-explosion"}
					}	
				}
			}
		},
		animation = nil,
		shadow = nil
	},
	
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  {
    type = "smoke-with-trigger",
    name = "radioactive-cloud",
    flags = {"not-on-map"},
    show_when_smoke_off = true,
    particle_count = 40,
    particle_spread = { 85,85 },
    particle_distance_scale_factor = 0.5,
    particle_scale_factor = { 1.5, 1.5 },
    wave_speed = { 1/80, 1/60 },
    wave_distance = { 0.3, 0.2 },
    spread_duration_variation = 20;
    particle_duration_variation = 60 * 3;
    render_layer = "object",
    affected_by_wind = false,
    cyclic = true,
    duration = 60*160,
    fade_away_duration = 2 * 60,
    spread_duration = 20,
    color = {r = 0.24, g = 0.72, b = 0.09, a = 0.5}, -- #
    animation =
    {
      width = 152,
      height = 120,
      line_length = 5,
      frame_count = 60,
      shift = {-0.53125, -0.4375},
      priority = "high",
      animation_speed = 0.25,
      filename = "__base__/graphics/entity/smoke/smoke.png", --
      flags = { "smoke" }
    },
    created_effect =
    {
	
    },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/fight/poison-cloud.ogg",
        volume = 0.7
      },
    },
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
			type = "nested-result",
			action =
			{
				{
				type = "area",
				radius = 105,
				action_delivery =
					{
						type = "instant",
						target_effects =
						{
							{
							type = "damage",
							damage = { amount = 655, type = "radioactive"}
							},
							{
							type = "destroy-decoratives",
							include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
							include_decals = true,
							invoke_decorative_trigger = true,
							decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
							radius = 75 -- large radius for demostrative purposes
							},
							{
							type = "create-sticker",
							sticker = "slowdown-sticker-anti"
							}
						}
					}
				},
				{
				type = "area",
				radius = 105,
				action_delivery =
					{
						type = "instant",
						target_effects =
						{
							{
								type = "damage",
								damage = { amount = 95, type = "radioactive"}
							},
							{
								type = "destroy-decoratives",
								include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
								include_decals = true,
								invoke_decorative_trigger = true,
								decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
								radius = 75 -- large radius for demostrative purposes
							},
							{
								type = "create-sticker",
								sticker = "slowdown-sticker-anti"
							}
						}
					}
				},
          }
        }
      }
    },
    action_cooldown = 30
  },
  
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

{
    type = "smoke-with-trigger",
    name = "radioactive-area",
    flags = {"not-on-map"},
    show_when_smoke_off = true,
    particle_count = 25,
    particle_spread = {35,35},
    particle_distance_scale_factor = 1.5,
    particle_scale_factor = { 1.5, 1.5 },
    particle_duration_variation = 60 * 3;
    wave_speed = { 0.5 / 80, 0.5 / 60 },
    wave_distance = { 4, 0.5 },
    spread_duration_variation = 300 - 20;
    render_layer = "object",
    affected_by_wind = false,
    cyclic = true,
    duration = 60 * 350,
    fade_away_duration = 3 * 60,
    spread_duration = (300 - 20) / 2 ,
    color = {r = 0.24, g = 0.72, b = 0.09, a = 0}, -- #0
    animation =
    {
      width = 608, --152d
      height = 480,
      line_length = 5,
      frame_count = 60,
      shift = {-0.53125, -0.4375},
      priority = "high",
      animation_speed = 0.25,
      filename = "__grid_of_inventory__/icons/smoke.png",
      flags = { "smoke" }
    },
	created_effect=
	{
			type = "cluster",
			cluster_count = 15,
			distance = 52,
			distance_deviation = 12.5,
			action_delivery =
			{
				type = "instant",
				target_effects =
				{
					type = "create-smoke",
					entity_name = "radioactive-cloud-visual-dummy",
					show_in_tooltip = false,
					initial_height = 0
				},
				{
					type = "damage",
					damage = { amount = 195, type = "radioactive"}
				}
			}
		},
	action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
			type = "nested-result",
			action =
			{
				{
				type = "area",
				radius = 105,
				action_delivery =
					{
						type = "instant",
						target_effects =
						{
							{
							type = "damage",
							damage = { amount = 655, type = "radioactive"}
							},
							{
							type = "destroy-decoratives",
							include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
							include_decals = true,
							invoke_decorative_trigger = true,
							decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
							radius = 75 -- large radius for demostrative purposes
							},
							{
							type = "create-sticker",
							sticker = "slowdown-sticker-anti"
							}
						}
					}
				},
				{
				type = "area",
				radius = 105,
				action_delivery =
					{
						type = "instant",
						target_effects =
						{
							{
								type = "damage",
								damage = { amount = 95, type = "radioactive"}
							},
							{
								type = "destroy-decoratives",
								include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
								include_decals = true,
								invoke_decorative_trigger = true,
								decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
								radius = 75 -- large radius for demostrative purposes
							},
							{
								type = "create-sticker",
								sticker = "slowdown-sticker-anti"
							}
						}
					}
				},
          }
        }
      }
    }
    --working_sound =
    --{
    --  sound =
    --  {
    --    filename = "__base__/sound/fight/poison-cloud.ogg",
    --    volume = 0.5
    --  },
    --},
  },

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	{
    type = "smoke-with-trigger",
    name = "radioactive-cloud-visual-dummy",
    flags = {"not-on-map"},
    show_when_smoke_off = true,
    particle_count = 45,
    particle_spread = {45,45},
    particle_distance_scale_factor = 1.5,
    particle_scale_factor = { 1.5, 1.5 },
    particle_duration_variation = 60 * 3;
    wave_speed = { 0.5 / 80, 0.5 / 60 },
    wave_distance = { 4, 0.5 },
    spread_duration_variation = 300 - 20;
    render_layer = "object",
    affected_by_wind = false,
    cyclic = true,
    duration = 60 * 150,
    fade_away_duration = 3 * 60,
    spread_duration = (300 - 20) / 2 ,
    color = {r = 0.24, g = 0.72, b = 0.09, a = 0.5}, -- #0
    animation =
    {
      width = 608, --152d
      height = 480,
      line_length = 5,
      frame_count = 60,
      shift = {-0.53125, -0.4375},
      priority = "high",
      animation_speed = 0.25,
      filename = "__grid_of_inventory__/icons/smoke.png",
      flags = { "smoke" }
    },
	action={
		type = "direct",
		action_delivery =
		{
			type = "instant",
			target_effects =
			{
			type = "nested-result",
			action =
			{
				type = "area",
				radius = 95,
				action_delivery =
				{
					type = "instant",
					target_effects =
					{
						{
							type = "damage",
							damage = { amount = 525, type = "radioactive"}
						},
						{
						type = "destroy-decoratives",
						include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
						include_decals = true,
						invoke_decorative_trigger = true,
						decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
						radius = 80 -- large radius for demostrative purposes
						}
					}
				}
			}
		}
		}
		}
    --working_sound =
    --{
    --  sound =
    --  {
    --    filename = "__base__/sound/fight/poison-cloud.ogg",
    --    volume = 0.5
    --  },
    --},
  },
  
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

      {
    type = "sticker",
    name = "slowdown-sticker-anti",
    --icon = "__base__/graphics/icons/slowdown-sticker.png",
    duration_in_ticks = 30 * 20,
	damage_interval = 50,
    target_movement_modifier = 0.25
	}
	})
	
	for i = 1,15,1 do
	table.insert(data.raw["smoke-with-trigger"]["antimatter-cloud"].created_effect,
			{
			type = "cluster",
			cluster_count = 20,
			distance = 10+(i*10),
			distance_deviation = 22.5,
			action_delivery =
			{
			  type = "instant",
			  target_effects =
			  {
				type = "create-smoke",
				entity_name = "antimatter-cloud-visual-dummy",
				show_in_tooltip = false,
				initial_height = 0
			  },{
					type = "damage",
					damage = { amount = 295, type = "antimatter"}
				}
			}
		})
	end
	for i = 1,15,1 do
	table.insert(data.raw["smoke-with-trigger"]["radioactive-cloud"].created_effect,
			{
			type = "cluster",
			cluster_count = 15,
			distance = 10+(i*5),
			distance_deviation = 12.5,
			action_delivery =
			{
			  type = "instant",
			  target_effects =
			  {
				type = "create-smoke",
				entity_name = "radioactive-cloud-visual-dummy",
				show_in_tooltip = false,
				initial_height = 0
			  },{
					type = "damage",
					damage = { amount = 195, type = "radioactive"}
				}
			}
		})
	end
end