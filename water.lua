require "liquid"

Water = {}
Water.__index = Water
setmetatable(Water, Liquid)

function Water:new(x, y)
	local instance = setmetatable({}, Water)
	instance.r = 0
	instance.g = 0
	instance.b = 255
	instance.material = "water"
	instance.density = 5
	instance.id = 4
	
	
	return instance
end


function Water:draw(x, y)
	self.x = x 
	self.y = y
	love.graphics.setColor(self.r, self.g, 255, 255)
	love.graphics.rectangle("fill", (self.x-1) * cellSize, (self.y-1) * cellSize, cellSize, cellSize)
end

