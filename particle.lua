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
	self.canUpdate = false
	currentGrid[self.x][self.y] = self
end

--Function to run the particles rules
function Particle:updateParticle(x, y, currentGrid)
	local grid = currentGrid
	self.x = x
	self.y = y
	if self.canUpdate == true then
		Particle:gravity(self.x, self.y, self.density)
		self.canUpdate = false
	end
	
	
end
--Draws particle
function Particle:draw(x, y)
	self.x = x 
	self.y = y
	love.graphics.setColor(25, 25, 25, 255)
	love.graphics.rectangle("fill", (self.x-1) * cellSize, (self.y-1) * cellSize, cellSize, cellSize)
end


--Applies gravity to particle
function Particle:gravity(x, y, density)
	local grid = currentGrid
	self.density = density
	self.x = x
	self.y = y
	local below = grid[self.x][self.y + 1]
	local check
	if Particle:checkDown(self.x, self.y) ~= nil and self.density > below.density then
		currentGrid[self.x][self.y] = below
		below.y = below.y - 1
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