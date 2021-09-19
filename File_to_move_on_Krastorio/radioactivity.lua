-- Remotes
if not remote.interfaces["kr-radioactivity"] then
	remote.add_interface("kr-radioactivity",
	{
		set_no_radioactivity = 
		function(bool)
			if type(bool) ~= "boolean" then 
				error("Value for 'set_no_radioactivity' must be a boolean.")
			end
			global.radioactivity_enabled = not bool
		end,
		add_radioactive_entity = 
		function(entity_name)
			if type(entity_name) ~= "string" then 
				error("Value for 'entity_name' must be a string.")
			end
			
			if not global.krastorio.radioactive_entities then
				global.krastorio.radioactive_entities = {}
			end
			table.insert(global.krastorio.radioactive_entities, entity_name)
		end,
		remove_radioactive_entity = 
		function(entity_name)
			if type(entity_name) ~= "string" then 
				error("Value for 'entity_name' must be a string.")
			end
			
			if global.krastorio.radioactive_entities then
				for i, name in pairs(global.krastorio.radioactive_entities) do
					if entity_name == name then
						table.remove(global.krastorio.radioactive_entities, i)
						break
					end
				end
			end
		end,
		add_radioactive_item = 
		function(item_name)
			if type(item_name) ~= "string" then 
				error("Value for 'item_name' must be a string.")
			end
			
			if not global.krastorio.radioactive_items then
				global.krastorio.radioactive_items = {}
			end
			table.insert(global.krastorio.radioactive_items, item_name)
		end,
		remove_radioactive_item = 
		function(item_name)
			if type(item_name) ~= "string" then 
				error("Value for 'item_name' must be a string.")
			end
			
			if global.krastorio.radioactive_items then
				for i, name in pairs(global.krastorio.radioactive_items) do
					if item_name == name then
						table.remove(global.krastorio.radioactive_items, i)
						break
					end
				end
			end
		end,
		set_radioactive_area_offset =
		function(radius)
			if type(radius) ~= "number" then 
				error("Value for 'radius' must be a number.")
			end
			if type(radius) < 1 then 
				error("Value for 'radius' must be greater of zero.")
			end
				
			global.krastorio.radioactive_area_offset = radius
		end
	})
end

-- Commands for users
if not commands.commands["kr-enable-radioactivity"] then
	local function enableRadioactivity(player)
	setupKRGlobalVariables()
		local pass=false
		if player.parameter then
			player_target=game.players[player.parameter]
			if player_target then
				if player_target.connected then
					game.players[player.player_index].print({"other.kr-enable-radioactivity-player",player.parameter})
					pass=true
								else
					game.players[player.player_index].print({"other.kr-radioactivity-error-player-offline",player.parameter})
				end
			else
				game.players[player.player_index].print({"other.kr-radioactivity-error-name",player.parameter})
			end
		else
			pass=true
			player_target=game.players[player.player_index]
			global.radioactivity_enabled = true
			game.players[player.player_index].print({"other.kr-enable-radioactivity"})
		end
		if pass then
			setupKRGlobalVariables()
			settings.get_player_settings(player_target)["kr-enable-radioactivity"]= {value = true}
		end
	end
	commands.add_command("kr-enable-radioactivity", {"other.kr-enable-radioactivity-help"}, enableRadioactivity)
end

if not commands.commands["kr-show-radioactive-items"] then
	local function showradioactiveitems()
		for _,radioactive_item in pairs(global.krastorio.radioactive_items) do
			game.print("Nome oggetto radioattivo --> "..radioactive_item[1]..", radioattività per "..global.krastorio.tick.." tick --> "..radioactive_item[2]..", raggio d'azione.. --> "..radioactive_item[3])
		end
	end
	commands.add_command("kr-show-radioactive-items", {""}, showradioactiveitems)
end

if not commands.commands["kr-disable-radioactivity"] then
	local function disableRadioactivity(player)
		local pass=false
		if player.parameter then
			player_target=game.players[player.parameter]
			if player_target then
				if player_target.connected then
					game.players[player.player_index].print({"other.kr-disable-radioactivity-player",player.parameter})
					pass=true
				else
					game.players[player.player_index].print({"other.kr-radioactivity-error-player-offline",player.parameter})
				end
			else
				game.players[player.player_index].print({"other.kr-radioactivity-error-name",player.parameter})
			end
		else
			pass=true
			player_target=game.players[player.player_index]
			global.radioactivity_enabled = false
			game.players[player.player_index].print({"other.kr-disable-radioactivity"})
		end
		if pass then
			setupKRGlobalVariables()
			settings.get_player_settings(player_target)["kr-enable-radioactivity"]= {value = false}
		end
	end
	commands.add_command("kr-disable-radioactivity", {"other.kr-disable-radioactivity-help"}, disableRadioactivity)
end

local function onInitAndConf()
	setupKRGlobalVariables()
	if not global.krastorio.radioactivity_lock then
		global.krastorio.radioactivity_lock = true
	end
	if not global.krastorio.script_initialization_status["radioactivity"] then
		global.krastorio.script_initialization_status["radioactivity"] = true
	end
end

function setupKRGlobalVariables()
	
	global.krastorio.radioactivity_lock = true
	global.krastorio.radioactive_entities =
	{
		{"uranium-ore",2.5,6},
		{"radioactive-cloud",160,10},
		{"radioactive-cloud-rocket",120,15},
		{"nuke-explosion",600,55},
		{"radioactive-cloud-visual-dummy",80,25.5},
		{"radioactive-cloud-visual-dummy-rocket",40,15.5},
		{"atomic-bomb-wave",55,15},
		{"atomic-bomb-wave-rocket",35,10},
		{"atomic-nuke-shockwave",25,15},
		{"radioactive-area",25,95},
		{"radioactive-area-rocket",25,45}
	}

	global.krastorio.radioactive_items =
	{
		-- Uranium
		{"uranium-ore",2,8.5},
		{"uranium-235",1.5,4.85},
		{"uranium-238",1,4.45},
		{"uranium-fuel-cell",1.2,4.05},
		{"nuclear-fuel",0.5,3.5},
		{"used-up-uranium-fuel-cell",0.2,1.5},
		{"tritium",1.5,5.25},
		{"dt-fuel",1.2,2.5},
		{"radioactive-empty-dt-fuel",0.75,2.35},
		{"radioactive-iron-ore",1.45,4.35},
		{"radioactive-stone",1.2,4.25}
	}
	
	global.krastorio.containers={
			{"wooden-",-2.5},
			{"iron-",0.5},
			{"steel-",1.5},
			{"medium",4.5},
				{"big",3.5},
			{"logistic",0.25}
					
	}
	
	global.krastorio.antimatter_entities=
	{
		{"matter-explosion",120,45},
		{"antimatter-cloud",50,60},
		{"antimatter-cloud-rocket",25,30},
		{"antimatter-cloud-visual-dummy",195,85},
		{"antimatter-cloud-visual-dummy-rocket",105,45}
	}
end

function doRadioactiveDamage(player,base_damage)
	if player.valid and player.character and player.character.valid then
		local character = player.character
		local base_damage = base_damage
		player.play_sound
		{
			path            = "kr-radioactive",
			position        = character.position,
			volume_modifier = 0.5
		}
		character.damage(base_damage, "enemy", "radioactive")
		if character and character.valid then
			player.add_custom_alert(character, {type="virtual", name="kr-nuclear-2"}, {"other.kr-taking-radioactive-damage"}, false)	
		else
			player.remove_alert{icon={type="virtual", name="kr-nuclear-2"}, message={"other.kr-taking-radioactive-damage"}}	
		end
	end
end

function doRadioactiveDamage_enemy(enemy,base_damage)
	local base_damage = base_damage
	if enemy.valid then
		enemy.damage(base_damage, "player", "radioactive")
	end
end

function doAntimatterDamage(player,base_damage)
	if player.valid and player.character and player.character.valid then
		local character = player.character
		local base_damage = base_damage
		player.play_sound
		{
			path            = "kr-antimatter",
			position        = character.position,
			volume_modifier = 0.5
		}
		character.damage(base_damage, "enemy", "antimatter")
		if character and character.valid then
			player.add_custom_alert(character, {type="virtual", name="kr-antimatter"}, {"other.kr-taking-antimatter-damage"}, false)	
		else
			player.remove_alert{icon={type="virtual", name="kr-antimatter"}, message={"other.kr-taking-antimatter-damage"}}	
		end
	end
end

local function radioactivity()
	if global.radioactivity_enabled ~= false and global.krastorio.radioactivity_lock then
		global.krastorio.radioactivity_lock = false
		for _,player in pairs(game.connected_players)do
			if settings.get_player_settings(player)["kr-enable-radioactivity"].value then
				local character = player.valid and player.character
				local cursor_stack = false
				if player.valid and player.cursor_stack and player.cursor_stack.valid_for_read then
					cursor_stack = player.cursor_stack.name
				end
				local player_is_valid=true
				if player.driving then
					local vehicle=player.vehicle
					if vehicle.name ~= "car" or vehicle.name ~= "cargo-wagon" then
						player_is_valid=false
					end
					local inventory = player.valid and (vehicle.get_inventory(defines.inventory.car_trunk) or vehicle.get_inventory(defines.inventory.cargo_wagon))
					if inventory and inventory.valid and not inventory.is_empty() then
						for i, item_name in pairs(global.krastorio.radioactive_items) do
							if inventory.get_item_count(item_name[1]) > 0 then
								doRadioactiveDamage(player,item_name[2]*(inventory.get_item_count(item_name[1])/3))
							end
						end
					end
					local inventory = player.valid and (vehicle.get_inventory(defines.inventory.spider_trash))
					if inventory and inventory.valid and not inventory.is_empty() then
						for i, item_name in pairs(global.krastorio.radioactive_items) do
							if inventory.get_item_count(item_name[1]) > 0 then
								doRadioactiveDamage(player,item_name[2]*(inventory.get_item_count(item_name[1])/3))
							end
						end
					end
				end
					if character and character.valid then
						local position = character.position
						-- Entities damages
						if player_is_valid then
						for _,global_radioactive_enitity in pairs(global.krastorio.radioactive_entities) do
							local entities=player.surface.find_entities_filtered{
								name = global_radioactive_enitity[1], 
								position=position,
								radius=global_radioactive_enitity[3]
							}
							if character then
								for i,entity in pairs(entities) do
									if entity.valid then
										if global_radioactive_enitity[1]==entity.name then
											doRadioactiveDamage(player,global_radioactive_enitity[2]*1.5)
										end
									end
								end
							end
						end
						for _,global_radioactive_item in pairs(global.krastorio.radioactive_items) do
							local cars=player.surface.find_entities_filtered{
								name = {"car","cargo-wagon"}, 
								position=position,
								radius=global_radioactive_item[3]
							}
							for e,car in pairs(cars) do
								local inventory = player.valid and (car.get_inventory(defines.inventory.car_trunk) or car.get_inventory(defines.inventory.cargo_wagon))
								if inventory and inventory.valid and not inventory.is_empty() then
									if inventory.get_item_count(global_radioactive_item[1]) > 0 then
										if car.name== "car" then	
											doRadioactiveDamage(player,global_radioactive_item[2]*(inventory.get_item_count(global_radioactive_item[1])/2))
										else 
											doRadioactiveDamage(player,global_radioactive_item[2]*(inventory.get_item_count(global_radioactive_item[1])/4))
										end
										
									end
								end
							end
						
							local items_on_ground=player.surface.find_entities_filtered{
								position=position,
								radius=global_radioactive_item[3],
								type ="item-entity"
							}
						
							for _, item_on_ground in pairs(items_on_ground) do
									if item_on_ground.stack.name == global_radioactive_item[1] then
										doRadioactiveDamage(player,global_radioactive_item[2])
									end
							end
						
							local transport_belts=player.surface.find_entities_filtered{
								position=position,
								radius=global_radioactive_item[3],
								type ={"transport-belt","underground-belt","splitter","loader-1x1"}
							}
							for _,transport_belt in pairs(transport_belts) do
								for i=1,2,1 do
									if transport_belt.get_transport_line(i).get_contents()[global_radioactive_item[1]]~=nil then
										doRadioactiveDamage(player,global_radioactive_item[2])
									end
								end
							end
							for _,container in pairs(global.krastorio.containers) do
								local chests=player.surface.find_entities_filtered{
									type = {"container","logistic-container"},--fare in modo che si riduga il raggio in base al tipo di cassa
									position=position,
									radius=global_radioactive_item[3]
								}
								for e,chest in pairs(chests) do
									if string.match(chest.name,container[1]) then
										local inventory = chest.valid and (chest.get_inventory(defines.inventory.chest))
										if inventory and inventory.valid and not inventory.is_empty() then
											if inventory.get_item_count(global_radioactive_item[1]) > 0 and inventory.get_item_count(global_radioactive_item[1]) < 2000 then
												if chest.name== "wooden-chest" then
													doRadioactiveDamage(player,global_radioactive_item[2]*inventory.get_item_count(global_radioactive_item[1]))
												elseif chest.name== "iron-chest" then
													doRadioactiveDamage(player,global_radioactive_item[2]*(inventory.get_item_count(global_radioactive_item[1])/1.5))
												elseif chest.name== "steel-chest" then
													doRadioactiveDamage(player,global_radioactive_item[2]*(inventory.get_item_count(global_radioactive_item[1])/2.2))
												elseif string.match(chest.name,"medium") then
													doRadioactiveDamage(player,global_radioactive_item[2]*(inventory.get_item_count(global_radioactive_item[1])/3.5))
												elseif string.match(chest.name,"big") then
													doRadioactiveDamage(player,global_radioactive_item[2]*(inventory.get_item_count(global_radioactive_item[1])/6))
												else
													doRadioactiveDamage(player,global_radioactive_item[2]*(inventory.get_item_count(global_radioactive_item[1])/1.85))
												end
											else 
												if inventory.get_item_count(global_radioactive_item[1]) > 2000 then
													if chest.name== "wooden-chest" then
														doRadioactiveDamage(player,global_radioactive_item[2]*2000)
													elseif chest.name== "iron-chest" then
														doRadioactiveDamage(player,global_radioactive_item[2]*2000/1.5)
													elseif chest.name== "steel-chest" then
														doRadioactiveDamage(player,global_radioactive_item[2]*2000/2.2)
													elseif string.match(chest.name,"medium") then
														doRadioactiveDamage(player,global_radioactive_item[2]*2000/3.5)
													elseif string.match(chest.name,"big") then
														doRadioactiveDamage(player,global_radioactive_item[2]*2000/6)
													else
														doRadioactiveDamage(player,global_radioactive_item[2]*2000/1.85)
													end
												end
											end
										end
									end
								end
							end
							local near_players = player.surface.find_entities_filtered{
								type={"player"},
								position=position,
								radius=global_radioactive_item[3]
							}
							for e,near_player in pairs(near_players) do 
									if near_player.valid then
										if near_player ~= player then
											if settings.get_player_settings(near_player)["kr-enable-radioactivity"].value then
												local inventory = player.valid and (near_player.get_main_inventory())
												if inventory and inventory.valid and not inventory.is_empty() then
													if inventory.get_item_count(global_radioactive_item[1]) > 0 and inventory.get_item_count(global_radioactive_item[1]) < 2000 then
														doRadioactiveDamage(player,global_radioactive_item[2]*inventory.get_item_count(global_radioactive_item[1])/1.85)
													end
												end
											end
										end
									end
							end
					end
				end
				
				-- -- Items damages	
				-------------------
				-- Cursor item
				if cursor_stack then
					for i, item_name in pairs(global.krastorio.radioactive_items) do
						if cursor_stack == item_name[1] then
							doRadioactiveDamage(player,global.krastorio.radioactive_items[i][2]*(player.cursor_stack.count/2))
						end
					end
				end	
				
				-- Main inventory
				local inventory = player.valid and player.get_main_inventory()
				if inventory and inventory.valid and not inventory.is_empty() then
					for i, item_name in pairs(global.krastorio.radioactive_items) do
						if inventory then
							if inventory.valid then
								if inventory.get_item_count(item_name[1]) > 0 then
									doRadioactiveDamage(player,global.krastorio.radioactive_items[i][2]*inventory.get_item_count(item_name[1]))
								end
							end
						end
					end
				end
				
				-- Trash inventory
				if character then
					local trash_inventory = character.valid and character.get_inventory(defines.inventory.character_trash)
					if trash_inventory and trash_inventory.valid and not trash_inventory.is_empty() then
						for i, item_name in pairs(global.krastorio.radioactive_items) do
							if trash_inventory.get_item_count(item_name[1]) > 0 then
								doRadioactiveDamage(player,global.krastorio.radioactive_items[i][2]*trash_inventory.get_item_count(item_name[1]))
							end
						end
					end
				end
				-------------------
			end
		end
		global.krastorio.radioactivity_lock = true
	end
end
end
local function antimattereffect()
	for _, player in pairs(game.connected_players) do
		local character = player.valid and player.character
		if character and character.valid then
			local position = character.position
			-- Entities damages
			for i, global_krastorio_antimatter_entity in pairs(global.krastorio.antimatter_entities) do
				if player.surface.count_entities_filtered
				{
					name = global_krastorio_antimatter_entity[1], 
					position=position,
					radius=global_krastorio_antimatter_entity[3]
				} > 0 
				then
					doAntimatterDamage(player,global_krastorio_antimatter_entity[2])
				end
			end
		end
	end
end

return
{	
	
	
	-- -- Bootstrap
	-- For setup variables
	{ onInitAndConf, "on_init" },
	{ onInitAndConf, "on_configuration_changed" },
	-- -- Actions
	{radioactivity, "on_nth_tick", 20 },
	{antimattereffect, "on_nth_tick", 20 }
}