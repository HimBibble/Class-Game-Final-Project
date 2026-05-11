require "particle"


Air = {}
Air.__index = Air
setmetatable(Air, Particle)

function Air:new(x, y)
	local instance = setmetatable({}, Air)
	instance.material = "air"
	instance.density = 0
	instance.id = 0
	
	return instance
end

function Air:draw()

end
