
local M={}
function M.add_grid(x,y)

	local spider_grid = data.raw['equipment-grid']['kr-spidertron-equipment-grid']
	
	M.name=spider_grid.name
	-- increase grid size from 10x6
	spider_grid.width = 24
	spider_grid.height = 22

	-- add new equipment category just for exoskeletons in spidertron
	data:extend{{
		type = 'equipment-category',
		name = 'spider-legs',
	}}
	table.insert(spider_grid.equipment_categories, 'spider-legs')

	-- add exoskeletons to category
	for name, equipment in pairs(data.raw['movement-bonus-equipment']) do
		if string.find(name, 'exoskeleton') then
			table.insert(equipment.categories, 'spider-legs')
		end
	end
end
return M
