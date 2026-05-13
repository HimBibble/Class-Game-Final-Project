require "particle"


Air = {}
Air.__index = Air
setmetatable(Air, Particle)

function Air:new(x, y)
	local instance = setmetatable({}, Air)
	instance.material = "air"
	instance.density = 0
	instance.id = 1
	
	return instance
end

function Air:draw(x, y)
	self.x = x 
	self.y = y
	love.graphics.setColor(25, 255, 25, 255)
	love.graphics.rectangle("fill", (self.x-1) * cellSize, (self.y-1) * cellSize, cellSize, cellSize)
end
