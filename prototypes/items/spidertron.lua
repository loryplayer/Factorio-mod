require("equipment-grid")
local sounds = require("prototypes.items.entity.sounds")
function create_spidertron_mk(arguments)
local scale = arguments.scale
local leg_scale = scale * arguments.leg_scale

data:extend(
{
  {
    type = "spider-vehicle",
    name = arguments.name,
    collision_box = {{-1 * scale, -1 * scale}, {1 * scale, 1 * scale}},
    selection_box = {{-1 * scale, -1 * scale}, {1 * scale, 1 * scale}},
    drawing_box = {{-3 * scale, -4 * scale}, {3 * scale, 2 * scale}},
    icon = "__base__/graphics/icons/spidertron.png",
    mined_sound = {filename = "__core__/sound/deconstruct-large.ogg",volume = 0.8},
    open_sound = { filename = "__base__/sound/spidertron/spidertron-door-open.ogg", volume= 0.35 },
    close_sound = { filename = "__base__/sound/spidertron/spidertron-door-close.ogg", volume = 0.4 },
    sound_minimum_speed = 0.1,
    sound_scaling_ratio = 0.6,
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/spidertron/spidertron-vox.ogg",
        volume = 0.35
      },
      activate_sound =
      {
        filename = "__base__/sound/spidertron/spidertron-activate.ogg",
        volume = 0.5
      },
      deactivate_sound =
      {
        filename = "__base__/sound/spidertron/spidertron-deactivate.ogg",
        volume = 0.5
      },
      match_speed_to_activity = true
    },
    icon_size = 64, icon_mipmaps = 4,
    weight = 2,
    braking_force = 1,
    friction_force = 1,
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
    collision_mask = {},
    minable = {mining_time = 1, result =arguments.name},
    max_health = arguments.max_health, --3000
    resistances =
    {
      {
        type = "fire",
        decrease = arguments.resistances.fire.decrease,--15
        percent = arguments.resistances.fire.percent --60
      },
      {
        type = "physical",
        decrease = arguments.resistances.physical.decrease,--15
        percent = arguments.resistances.physical.percent --60
      },
      {
        type = "impact",
        decrease = arguments.resistances.impact.decrease,--50
        percent = arguments.resistances.impact.percent --80
      },
      {
        type = "explosion",
        decrease = arguments.resistances.explosion.decrease,--20
        percent = arguments.resistances.explosion.percent --75
      },
      {
        type = "acid",
        decrease = arguments.resistances.acid.decrease, --0
        percent = arguments.resistances.acid.percent --70
      },
      {
        type = "laser",
        decrease = arguments.resistances.laser.decrease0, --0
        percent = arguments.resistances.laser.percent --70
      },
      {
        type = "electric",
        decrease = arguments.resistances.electric.decrease, --0
        percent = arguments.resistances.electric.percent --0
      }
    },
    minimap_representation =
    {
      filename = "__base__/graphics/entity/spidertron/spidertron-map.png",
      flags = {"icon"},
      size = {128, 128},
      scale = 0.5
    },
    corpse = "spidertron-remnants",
    dying_explosion = "spidertron-explosion",
    energy_per_hit_point = 1,
    guns = { "spidertron-rocket-launcher-1", "spidertron-rocket-launcher-2", "spidertron-rocket-launcher-3", "spidertron-rocket-launcher-4" },
	inventory_size = arguments.inventory_size, --90
    equipment_grid = arguments.equipment_grid,
    trash_inventory_size = arguments.trash_inventory_size, --20
    height = 2  * scale * leg_scale,
    torso_rotation_speed = arguments.torso_rotation_speed, --0.008
    chunk_exploration_radius = arguments.chunk_exploration_radius, --2
    selection_priority = 51,
    graphics_set = spidertron_torso_graphics_set(scale),
    energy_source =
    {
      type = "void"
    },
    movement_energy_consumption = arguments.movement_energy_consumption, --250kW
    automatic_weapon_cycling = true,
    chain_shooting_cooldown_modifier = arguments.chain_shooting_cooldown_modifier, --0.5
    spider_engine =
    {
      legs =
      {
        { -- 1
          leg = arguments.name .. "-leg-1",
          mount_position = util.by_pixel(15  * scale, -22 * scale),--{0.5, -0.75},
          ground_position = {2.25  * leg_scale, -2.5  * leg_scale},
          blocking_legs = {2},
          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
        },
        { -- 2
          leg = arguments.name .. "-leg-2",
          mount_position = util.by_pixel(23  * scale, -10  * scale),--{0.75, -0.25},
          ground_position = {3  * leg_scale, -1  * leg_scale},
          blocking_legs = {1, 3},
          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
        },
        { -- 3
          leg = arguments.name .. "-leg-3",
          mount_position = util.by_pixel(25  * scale, 4  * scale),--{0.75, 0.25},
          ground_position = {3  * leg_scale, 1  * leg_scale},
          blocking_legs = {2, 4},
          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
        },
        { -- 4
          leg = arguments.name .. "-leg-4",
          mount_position = util.by_pixel(15  * scale, 17  * scale),--{0.5, 0.75},
          ground_position = {2.25  * leg_scale, 2.5  * leg_scale},
          blocking_legs = {3},
          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
        },
        { -- 5
          leg = arguments.name .. "-leg-5",
          mount_position = util.by_pixel(-15 * scale, -22 * scale),--{-0.5, -0.75},
          ground_position = {-2.25 * leg_scale, -2.5 * leg_scale},
          blocking_legs = {6, 1},
          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
        },
        { -- 6
          leg = arguments.name .. "-leg-6",
          mount_position = util.by_pixel(-23 * scale, -10 * scale),--{-0.75, -0.25},
          ground_position = {-3 * leg_scale, -1 * leg_scale},
          blocking_legs = {5, 7},
          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
        },
        { -- 7
          leg = arguments.name .. "-leg-7",
          mount_position = util.by_pixel(-25 * scale, 4 * scale),--{-0.75, 0.25},
          ground_position = {-3 * leg_scale, 1 * leg_scale},
          blocking_legs = {6, 8},
          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
        },
        { -- 8
          leg = arguments.name .. "-leg-8",
          mount_position = util.by_pixel(-15 * scale, 17 * scale),--{-0.5, 0.75},
          ground_position = {-2.25 * leg_scale, 2.5 * leg_scale},
          blocking_legs = {7},
          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
        }
      },
      military_target = "spidertron-military-target"
    }
  },
  make_spidertron_mk_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 1),
  make_spidertron_mk_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 2),
  make_spidertron_mk_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 3),
  make_spidertron_mk_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 4),
  make_spidertron_mk_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 5),
  make_spidertron_mk_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 6),
  make_spidertron_mk_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 7),
  make_spidertron_mk_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 8),
})
end
function make_spidertron_mk_leg(spidertron_name, scale, leg_thickness, movement_speed, number, base_sprite, ending_sprite)
  return
  {
    type = "spider-leg",
    name = spidertron_name .. "-leg-" .. number,

    localised_name = {"entity-name.spidertron-leg"},
    collision_box = {{-0.05, -0.05}, {0.05, 0.05}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    icon = "__base__/graphics/icons/spidertron.png",
    icon_size = 64, icon_mipmaps = 4,
    walking_sound_volume_modifier = 0.6,
    target_position_randomisation_distance = 0.25 * scale,
    minimal_step_size = 1 * scale,
    working_sound =
    {
      match_progress_to_activity = true,
      sound = sounds.spidertron_leg,
      audible_distance_modifier = 0.5
    },
    part_length = 3.5 * scale,
    initial_movement_speed = 0.06 * movement_speed,
    movement_acceleration = 0.03 * movement_speed,
    max_health = 100,
    movement_based_position_selection_distance = 4 * scale,
    selectable_in_game = false,
    graphics_set = create_spidertron_leg_graphics_set(scale * leg_thickness, number)
  }
end
create_spidertron_mk{name = "spidertron-mk1",
                  scale = 1.05,
                  leg_scale = 1.05, -- relative to scale
                  leg_thickness = 1, -- relative to leg_scale
                  leg_movement_speed = 1.05,
				  max_health=4000,
				  resistances={fire={decrease=10,percent=65},physical={decrease=5,percent=70},impact={decrease=40,percent=75},explosion={decrease=10,percent=45},acid={decrease=25,percent=35},laser={decrease=5,percent=85},electric={decrease=5,percent=50}},
				  equipment_grid="spidertron-equipment-grid-mk1",
				  inventory_size=100,
				  trash_inventory_size=25,
				  torso_rotation_speed=0.008,
				  chunk_exploration_radius=2.5,
				  movement_energy_consumption="310KW",
				  chain_shooting_cooldown_modifier=0.45
				  }
create_spidertron_mk{name = "spidertron-mk2",
                  scale = 1.1,
                  leg_scale = 1.1, -- relative to scale
                  leg_thickness = 1, -- relative to leg_scale
                  leg_movement_speed = 1.05,
				  max_health=4500,
				  resistances={fire={decrease=15,percent=60},physical={decrease=25,percent=90},impact={decrease=58,percent=87},explosion={decrease=15,percent=75},acid={decrease=3,percent=70},laser={decrease=60,percent=25},electric={decrease=26,percent=0}},
				  equipment_grid="spidertron-equipment-grid-mk2",
				  inventory_size=120,
				  trash_inventory_size=30,
				  torso_rotation_speed=0.010,
				  chunk_exploration_radius=3,
				  movement_energy_consumption="350KW",
				  chain_shooting_cooldown_modifier=0.40
				  }
create_spidertron_mk{name = "spidertron-mk3",
                  scale = 1.15,
                  leg_scale = 1.15, -- relative to scale
                  leg_thickness = 1, -- relative to leg_scale
                  leg_movement_speed = 1.15,
				  max_health=5000,
				  resistances={fire={decrease=70,percent=20},physical={decrease=50,percent=30},impact={decrease=20,percent=90},explosion={decrease=10,percent=95},acid={decrease=50,percent=70},laser={decrease=40,percent=70},electric={decrease=60,percent=5}},
				  equipment_grid="spidertron-equipment-grid-mk3",
				  inventory_size=140,
				  trash_inventory_size=35,
				  torso_rotation_speed=0.012,
				  chunk_exploration_radius=3.5,
				  movement_energy_consumption="380KW",
				  chain_shooting_cooldown_modifier=0.35
				  }
create_spidertron_mk{name = "spidertron-mk4",
                  scale = 1.2,
                  leg_scale = 1.20, -- relative to scale
                  leg_thickness = 1, -- relative to leg_scale
                  leg_movement_speed = 1.25,
				  max_health=5500,
				  resistances={fire={decrease=1,percent=99},physical={decrease=70,percent=25},impact={decrease=1,percent=99},explosion={decrease=2,percent=99},acid={decrease=35,percent=23},laser={decrease=60,percent=12},electric={decrease=34,percent=15}},
				  equipment_grid="spidertron-equipment-grid-mk4",
				  inventory_size=160,
				  trash_inventory_size=40,
				  torso_rotation_speed=0.014,
				  chunk_exploration_radius=40,
				  movement_energy_consumption="400KW",
				  chain_shooting_cooldown_modifier=0.30
				  }
create_spidertron_mk{name = "spidertron-mk5",
                  scale = 1.3,
                  leg_scale = 1.25, -- relative to scale
                  leg_thickness = 1, -- relative to leg_scale
                  leg_movement_speed = 1.4,
				  max_health=6000,
				  resistances={fire={decrease=1,percent=99},physical={decrease=5,percent=85},impact={decrease=10,percent=80},explosion={decrease=5,percent=96},acid={decrease=1,percent=70},laser={decrease=8,percent=70},electric={decrease=2,percent=50}},
				  equipment_grid="spidertron-equipment-grid-mk5",
				  inventory_size=200,
				  trash_inventory_size=50,
				  torso_rotation_speed=0.015,
				  chunk_exploration_radius=5,
				  movement_energy_consumption="480KW",
				  chain_shooting_cooldown_modifier=0.01
				  }