require "powder"

Sand = {}
Sand.__index = Sand
setmetatable(Sand, Powder)

function Sand:new(x, y)
	local instance = setmetatable({}, Sand)
	instance.r = 255
	instance.g = 255
	instance.b = 0
	instance.material = "sand"
	instance.density = 10
	instance.id = 1
	
	return instance
end
