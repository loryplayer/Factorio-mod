local lucnh = require("data-final-fixes")
function on_research_finished(event)
	game.print(event.research.name)
	if event.research.name == "kr-spidertron-1" then
		check(12,8)
	 elseif event.research.name == "kr-spidertron-2" then
		check(14,10)
	elseif event.research.name == "kr-spidertron-3" then
		check(16,12)
	 elseif event.research.name == "kr-spidertron-4" then
		check(18,14)
	 elseif event.research.name == "kr-spidertron-5" then
		check(20,16)
	 elseif event.research.name == "kr-spidertron-6" then
		check(25,20)
	end
end

function check(x,y)	
		game.print(lucnh.name)
		lucnh.add_grid(x,y)
end

script.on_event(defines.events.on_research_finished,on_research_finished)