require "particle"


Powder = {}
Powder.__index = Powder
setmetatable(Powder, Particle)


--Handles the gravity rules for powder objects
function Powder:gravity(x, y, density, self)
	local grid = currentGrid
	self.density = density
	self.x = x
	self.y = y
	local below = currentGrid[self.x][self.y + 1]
	local belowL = currentGrid[self.x - 1][self.y + 1]
	local belowR = currentGrid[self.x + 1][self.y + 1]
	local check
	
	--Handles movement for powders
	if self:checkDown(self.x, self.y) ~= nil and self.density > below.density then
		currentGrid[self.x][self.y] = below
		self.y = self.y + 1
		currentGrid[self.x][self.y] = self
	elseif self:checkDownLeft(self.x, self.y) ~= nil and self.density > belowL.density then
		currentGrid[self.x][self.y] = belowL
		self.y = self.y + 1
		self.x = self.x - 1
		currentGrid[self.x][self.y] = self
	elseif self:checkDownRight(self.x, self.y) ~= nil and self.density > belowR.density then
		currentGrid[self.x][self.y] = belowR
		self.y = self.y + 1
		self.x = self.x + 1
		currentGrid[self.x][self.y] = self
	end
	
end