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
	self.cannotSimulate = false
	currentGrid[self.x][self.y] = self
end

--Function to run the particles rules
function Particle:updateParticle()
	print("updating particle!")
	--Particle:gravity(self)
end
--Draws particle
function Particle:draw(x, y)
	self.x = x
	self.y = y
	love.graphics.setColor(self.r, self.g, self.b, 255)
	love.graphics.rectangle("fill", (self.x-1) * cellSize, (self.y-1) * cellSize, cellSize, cellSize)
end
--Applies gravity to particle
function Particle:gravity()
	self.x = x
	self.y = y
	local check
	local below = currentGrid[self.x][self.y + 1]
	
	-- if self:checkDown() ~= nil and self.density > below.density then
		-- currentGrid[self.x][self.y] = below
		-- below.y = below.y - 1
		-- self.y = self.y + 1
		-- currentGrid[self.x][self.y] = self
	-- end
end

--CHECK DIRECTIONS--

function Particle:checkDown(self)
	
	local check = currentGrid[self.x][self.y+1]
	if check ~= nil then
		check = currentGrid[self.x][self.y+1]["material"]
	end
	
	return check
end