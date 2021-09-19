-- Path
local control_scripts_path               = "__grid_of_inventory__/Compatibility/Krastorio/control-scripts/"

-- Libs
ControlCallbackMerger = require("__Krastorio2__/lib/private/control-scripts/control-lib/control-callbacks-merger")
ccm = ControlCallbackMerger:new()

-- Scrips
local scripts =
{
	-- -- KRASTORIO 2 SCRIPTS
	-- Wireless script
	require(control_scripts_path .. "explosions"),
	-- Bonus items
}

-- Load all callbacks from control scripts (not for GUI events)
for _, script in pairs(scripts) do
	if script.callback then
		ccm:addCallBack(script)
	else -- is multiple callbacks
		ccm:addCallBacks(script)
	end
end


-- Active merged callbacks
ccm:activeCallbacks()
