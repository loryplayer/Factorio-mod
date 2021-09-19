local REACTORS =
{
	-- shelter entity name
	{
		filter = "name", 
        name   = "kr-antimatter-reactor"
    },
	{
		filter = "name", 
        name   = "nuclear-reactor"
    }
}
local function onInitAndConf()
	reactors=
	{
		{"kr-antimatter-reactor","charged-antimatter-fuel-cell","antimatter-rocket-projectile","antimatter-artillery-projectile"},
		{"nuclear-reactor","uranium-fuel-cell","atomic-rocket","atomic-artillery"}
	}
end

local function on_died(event)
	local entity=event.entity
	if entity.valid then
		local surface = entity.surface.name
		onInitAndConf()
		for _,reactor in pairs(reactors) do
			if entity.name==reactor[1] then
				local inventory = entity.get_inventory(defines.inventory.fuel)
				if inventory.get_item_count(reactor[2]) > 0 and inventory.get_item_count(reactor[2]) < 6 then
					game.surfaces[surface].create_entity{
						name=reactor[3],
						position=entity.position,
						target=entity,
						speed=1
					}
				elseif inventory.get_item_count(reactor[2]) >= 6 then
					game.surfaces[surface].create_entity{
					name=reactor[4],
					position=entity.position,
					target=entity,
					speed=1
					}
				end
			end
		end
	end
end

return
{	
	{ onInitAndConf, "on_init" },
	{ on_died, "on_entity_died",REACTORS}
}