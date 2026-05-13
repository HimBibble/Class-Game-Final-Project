Particle = {}
Particle.__index = Particle

function Particle:printCoords()
	love.graphics.print(self.x)
	love.graphics.print(self.y)
end

function Particle:new(x,y,r,g,b,a)
	self.x = x or 5
	self.y = y or 5
	self.r = r or 0
	self.g = g or 0
	self.b = b or 0
	self.a = a or 0
	self.material = "particle"
	self.canUpdate = true
	currentGrid[self.x][self.y] = self
end

--Function to run the particles rules
function Particle:updateParticle(x, y, currentGrid, self)
	local grid = currentGrid
	self.x = x
	self.y = y
	self = currentGrid[x][y]
	if self.canUpdate == true then
		self:gravity(self.x, self.y, self.density, self)
	elseif self.canUpdate == false then
		return
	end
	self.canUpdate = false
	
end
--Draws particle
function Particle:draw(x, y)
	self.x = x 
	self.y = y
	love.graphics.setColor(0, 255, 0, 255)
	love.graphics.rectangle("fill", (self.x-1) * cellSize, (self.y-1) * cellSize, cellSize, cellSize)
end


--Applies gravity to particle
function Particle:gravity(x, y, density, self)
	local grid = currentGrid
	self.density = density
	self.x = x
	self.y = y
	local below = currentGrid[self.x][self.y + 1]
	local check
	if self:checkDown(self.x, self.y) ~= nil and self.density > below.density then
		currentGrid[self.x][self.y] = below
		--below.y = below.y - 1
		self.y = self.y + 1
		currentGrid[self.x][self.y] = self
	end
	
end

--CHECK DIRECTIONS--

function Particle:checkDown(x, y)
	local grid = currentGrid
	self.x = x
	self.y = y
	local check = grid[self.x][self.y+1]
	if check ~= nil then
		check = grid[self.x][self.y+1]["material"]
	end
	return check
end

function Particle:checkDownLeft(x, y)
	local grid = currentGrid
	self.x = x
	self.y = y
	local check = grid[self.x - 1][self.y+1]
	if check ~= nil then
		check = grid[self.x][self.y+1]["material"]
	end
	return check
end

function Particle:checkDownRight(x, y)
	local grid = currentGrid
	self.x = x
	self.y = y
	local check = grid[self.x + 1][self.y+1]
	if check ~= nil then
		check = grid[self.x][self.y+1]["material"]
	end
	return check
end