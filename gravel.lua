require "powder"

Gravel = {}
Gravel.__index = Gravel
setmetatable(Gravel, Powder)

function Gravel:new(x, y)
	local instance = setmetatable({}, Gravel)
	instance.r = 125
	instance.g = 190
	instance.b = 25
	instance.material = "gravel"
	instance.density = 15
	instance.id = 3
	
	
	return instance
end


function Gravel:draw(x, y)
	self.x = x 
	self.y = y
	love.graphics.setColor(self.r, self.g, self.b, 255)
	love.graphics.rectangle("line", (self.x-1) * cellSize, (self.y-1) * cellSize, cellSize, cellSize)
end

