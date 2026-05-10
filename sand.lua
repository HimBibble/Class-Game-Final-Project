require "powder"

Sand = {}
Sand.__index = Sand
setmetatable(Sand, Powder)

function Sand.new(x, y)
	local instance = setmetatable({}, Sand)
	instance.x = x or 0
	instance.y = y or 0
	return instance
end