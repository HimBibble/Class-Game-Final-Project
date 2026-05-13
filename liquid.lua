require "particle"


Liquid = {}
Liquid.__index = Liquid
setmetatable(Liquid, Particle)


--Handles the gravity rules for Liquid objects
function Liquid:gravity(x, y, density, self)
	local grid = currentGrid
	self.density = density
	self.x = x
	self.y = y
	self.type = "liquid"
	local below = currentGrid[self.x][self.y + 1]
	local left = currentGrid[self.x - 1][self.y]
	local right = currentGrid[self.x + 1][self.y]
	local check
	
	--Handles movement for Liquids
	if self:checkDown(self.x, self.y) ~= nil and self.density > below.density then
		currentGrid[self.x][self.y] = below
		self.y = self.y + 1
		currentGrid[self.x][self.y] = self
	elseif self:checkRight(self.x, self.y) ~= nil and self.density > right.density then
		currentGrid[self.x][self.y] = right
		self.x = self.x + 1
		currentGrid[self.x][self.y] = self
	elseif self:checkLeft(self.x, self.y) ~= nil and self.density > left.density then
		currentGrid[self.x][self.y] = left
		self.x = self.x - 1
		currentGrid[self.x][self.y] = self
	end
	
end