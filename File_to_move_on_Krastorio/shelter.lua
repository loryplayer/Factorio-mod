require("__Krastorio2__/lib/private/control-scripts/control-lib/control-lib-initialization")

local KRASTORIO_SHELTER_EVENT_FILTER =
{
	-- shelter entity name
	{
		filter = "name", 
        name   = "kr-shelter"
    },
	{
		filter = "name", 
        name   = "kr-shelter-container"
    },
	{
		filter = "name", 
        name   = "kr-shelter-light"
    },
	{
		filter = "name", 
        name   = "kr-shelter-plus"
    },
	{
		filter = "name", 
        name   = "kr-shelter-plus-container"
    },
	{
		filter = "name", 
        name   = "kr-shelter-plus-light"
    }
}
local name_shelters={"kr-shelter-container","kr-shelter-plus-container"}
local function onInitAndConf()
	if global.krastorio.script_initialization_status["shelter"] then
		shelterVariablesInitializing()
		global.krastorio.script_initialization_status["shelter"] = true
	end
end
if not commands.commands["kr-shelter-refresh"] then
	local function refresh()
		shelterVariablesInitializing()
		game.print({"other.kr-shelter-refresh"})
	end
	commands.add_command("kr-shelter-refresh", {"other.kr-shelter-refresh-help"}, refresh)
end
-- The dictionary is structured like:
-- default_spawn_points[surface][force] -> position
-- spawn_points[surface][force] -> {animation, light}entity of shelter 

-- Called when the game is created
function shelterVariablesInitializing()
	global.krastorio.number_of_shelter={}
	global.krastorio.shelters={}
end
-- @event, on_built_entity or on_robot_built_entity
local function onBuiltAnEntity(event)
	local entity = event.created_entity or event.entity
	if entity.valid and (entity.name == "kr-shelter" or entity.name == "kr-shelter-plus") then
		local surface = entity.surface.name
		local force   = entity.force.index
		if global.krastorio.number_of_shelter[surface] then
			global.krastorio.number_of_shelter[surface]=global.krastorio.number_of_shelter[surface]+1
		else
			global.krastorio.number_of_shelter[surface]=1
		end
		local container=nil
		if entity.name == "kr-shelter" then
			-- create shelter light
			container= entity.surface.create_entity
			{
				type     = "container",
				name     = "kr-shelter-container",
				force    = entity.force,
				player   = entity.last_user,
				position = entity.position,
				create_build_effect_smoke = false
			}
			else
			-- create shelter plus light
			container=entity.surface.create_entity
			{
				type     = "container",
				name     = "kr-shelter-plus-container",
				
				force    = entity.force,
				player   = entity.last_user,
				position = entity.position,
				create_build_effect_smoke = false
			}
			end
			-- spawn passenger seats
			seats = {}
			for i = -2, 2, 1 do
				local seat = entity.surface.create_entity{
				name = "kr-shelter-seat",
				force = entity.force,
				position = {entity.position.x + i, entity.position.y +3}}
				seat.destructible = false
				table.insert(seats, seat)
			end
			if global.krastorio.shelters[surface] then
				global.krastorio.shelters[surface][global.krastorio.number_of_shelter[surface]]={{entity,container},seats}
			else
				global.krastorio.shelters[surface]={}
				global.krastorio.shelters[surface][global.krastorio.number_of_shelter[surface]]={{entity,container},seats}
			end
				
		end
	end
local function set_standard_spawn_point(player,surface)
	player.force.set_spawn_position({0,0}, surface)
	player.print({"other.kr-set_standard_spawn_point"})
end
local function set_spawn_point_on_another_shelter(player,index_of_shelter,surface)
if global.krastorio.shelters[surface][index_of_shelter][1][2].valid then
	player.force.set_spawn_position({global.krastorio.shelters[surface][index_of_shelter][1][2].position.x, global.krastorio.shelters[surface][index_of_shelter][1][2].position.y + 3}, surface)
	if global.krastorio.shelters[surface][index_of_shelter][3] then
		table.insert(global.krastorio.shelters[surface][index_of_shelter][3],player)
	else
		global.krastorio.shelters[surface][index_of_shelter][3]={}
		global.krastorio.shelters[surface][index_of_shelter][3][1]=player
	end
	player.print({"other.kr-set_spawn_point_on_another_shelter"})
	player.print("[gps="..global.krastorio.shelters[surface][index_of_shelter][1][2].position.x..","..global.krastorio.shelters[surface][index_of_shelter][1][2].position.y..","..surface.."]")
end
end

local function on_dead(entity)
	if entity.valid and (entity.name == "kr-shelter" or entity.name == "kr-shelter-container" or entity.name == "kr-shelter-light" or entity.name == "kr-shelter-plus" or entity.name == "kr-shelter-plus-container" or entity.name == "kr-shelter-plus-light") then
		local surface = entity.surface.name
		local force   = entity.force.index
		for i,shelter in pairs(global.krastorio.shelters[surface]) do
			if shelter[1][2]==entity then
				if global.krastorio.number_of_shelter[surface]==1 then --Remains only one shelter
					if shelter[3] then
						for _,player in pairs(shelter[3]) do 
							set_standard_spawn_point(player,shelter[1][2].surface)
						end
					end
				elseif global.krastorio.number_of_shelter[surface]>2then
					local distances={}
				for e,another_shelter in pairs(global.krastorio.shelters[surface]) do
					if another_shelter[1][2].valid and shelter[1][2].valid then
						distances[e]=math.sqrt((another_shelter[1][2].position.x-shelter[1][2].position.x)^2+(another_shelter[1][2].position.y-shelter[1][2].position.y)^2)
					end
				end
					local minimal_distance=distances[1]
					local index_of_minimal_distance=1
					for e,distance in pairs(distances) do 
						if distance >1 then
							if minimal_distance then
								if minimal_distance>distance then
									minimal_distance=distance
									index_of_minimal_distance=e
								end
							end
						end
					end
					if shelter[3] then
						for _,player in pairs(shelter[3]) do 
							if player and player.valid then
								set_spawn_point_on_another_shelter(player,index_of_minimal_distance,surface)
							end
						end	
					end
				else
					if shelter[3] then
						for _,player in pairs(shelter[3]) do 
							if player and player.valid then
								if global.krastorio.shelters[surface][1][1][2]==entity then
									set_spawn_point_on_another_shelter(player,2,surface)
								else	
									set_spawn_point_on_another_shelter(player,1,surface)
								end
							end
						end
					end
				end
				for _,seat in pairs(shelter[2]) do
					seat.destroy()
				end
				for _, entity_of_shelter in pairs(shelter[1]) do 
					if entity_of_shelter and entity_of_shelter.valid then
						entity_of_shelter.destroy()
					end
				end
				table.remove(global.krastorio.shelters,i)
			end
		end
		global.krastorio.number_of_shelter[surface]=global.krastorio.number_of_shelter[surface]-1
	end	
end

if not commands.commands["kr-remove-nearest-shelters"] then
	local function remove_nearest(param)
		local player= game.players[param.player_index]
		local position=player.position
		local shelters=game.surfaces[1].find_entities_filtered{ 
			name = {"kr-shelter","kr-shelter-container","kr-shelter-light","kr-shelter-plus","kr-shelter-plus-container","kr-shelter-plus-light","kr-shelter-seat"},
			position=position, radius=5
		}
		game.players[player.index].print({"other.kr-remove-nearest-shelters"})
		for _, shelter in pairs(shelters)do
			on_dead(shelter)
			shelter.destroy() 
		end
	end
	commands.add_command("kr-remove-nearest-shelters", {"other.kr-remove-nearest-shelters-help"}, remove_nearest)
end


local function set_spawn_point_on_shelter(player,shelter,index_of_shelter)
	local surface=shelter.surface.name
	player.force.set_spawn_position({shelter.position.x, shelter.position.y + 3}, surface)
	if global.krastorio.shelters[surface][index_of_shelter][3] then
		table.insert(global.krastorio.shelters[surface][index_of_shelter][3],player)
	else
		global.krastorio.shelters[surface][index_of_shelter][3]={}
		global.krastorio.shelters[surface][index_of_shelter][3][1]=player
	end
	player.print({"other.kr-set_spawn_point_on_shelter"})
end
-- @event, on_player_mined_entity or on_robot_mined_entity or on_entity_died
local function onRemovingAnEntity(event)
	local entity = event.entity
	on_dead(entity)
end

local function has_value(tab, val)
    for _, value in pairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end
local function onPlayerDrivingChangedState(event)
	local entity =event.entity
	if entity then
		if entity.valid then
			local surface = entity.surface.name
			if global.krastorio.shelters[surface] then
				for i,shelter in pairs(global.krastorio.shelters[surface]) do
					local player= game.players[event.player_index]
					local found_in_this_shelter=false
					for _,shelter_seat in pairs(shelter[2]) do
						if entity==shelter_seat then
							found_in_this_shelter=true
							if shelter[3]==nil then
								set_spawn_point_on_shelter(player,shelter[1][1],i)
							else
								if not has_value(shelter[3],player) then
									set_spawn_point_on_shelter(player,shelter[1][1],i)
								end
							end
						end
					end
					if not found_in_this_shelter then
						if shelter[3] then
							for player_index_on_another_shelter,player_on_another_shelter in pairs(shelter[3]) do
								if player_on_another_shelter==player then
									table.remove(shelter[3],player_index_on_another_shelter)
								end
							end
						end
					end
				end
			end
		end
	end
end

return
{
	-- -- Actions
	{ onPlayerDrivingChangedState,"on_player_driving_changed_state"},	
	{ saveStartPoint, "on_surface_created" }, 
	{ onBuiltAnEntity, "on_built_entity", KRASTORIO_SHELTER_EVENT_FILTER },
	{ onBuiltAnEntity, "on_robot_built_entity", KRASTORIO_SHELTER_EVENT_FILTER },
	{ onBuiltAnEntity, "script_raised_built" },
	{ onBuiltAnEntity, "script_raised_revive" },		
	{ onRemovingAnEntity, "on_player_mined_entity", KRASTORIO_SHELTER_EVENT_FILTER },
	{ onRemovingAnEntity, "on_robot_mined_entity", KRASTORIO_SHELTER_EVENT_FILTER },
	{ onRemovingAnEntity, "on_entity_died", KRASTORIO_SHELTER_EVENT_FILTER }
}
