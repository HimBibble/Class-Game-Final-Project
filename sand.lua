require "powder"

Sand = {}
Sand.__index = Sand
setmetatable(Sand, Powder)

function Sand.new(x, y, r, g, b)
	local instance = setmetatable({}, Sand)
	instance.x = x or 0
	instance.y = y or 0
	instance.type = "sand"
	instance.r = r or 0
	instance.g = g or 0
	instance.b = b or 0
	return instance
end