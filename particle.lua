Particle = Object.extend(Object)

function Particle:new(x, y, width, height, r, g, b, a)
	self.x = x
	self.y = y
	self.width = width
	self.height = height
	self.red = r
	self.green = g
	self.blue = b
	self.alpha = a
	self.material = "material"
	self.density = 10
	self.cannotSimulate = false
	
end

function Particle:checkUp()
	local check = currentGrid[self.x][self.y - 1]
	if check ~= nil then
		check = currentGrid[self.x][self.y - 1]["material"]
	end
	
	return check
end

function Particle:checkDown()
	local check = currentGrid[self.x][self.y + 1]
	if check ~= nil then
		check = currentGrid[self.x][self.y + 1]["material"]
	end
	
	return check
end

function Particle:checkLeft()
	local check = currentGrid[self.x - 1][self.y]
	if check ~= nil then
		check = currentGrid[self.x - 1][self.y]["material"]
	end
	
	return check
end

function Particle:checkRight()
	local check = currentGrid[self.x + 1][self.y]
	if check ~= nil then
		check = currentGrid[self.x + 1][self.y]["material"]
	end
	
	return check
end

function Particle:checkRightDown()
	local check = currentGrid[self.x + 1][self.y + 1]
	if check ~= nil then
		check = currentGrid[self.x + 1][self.y + 1]["material"]
	end
	
	return check
end

function Particle:checkLeftDown()
	local check = currentGrid[self.x - 1][self.y + 1]
	if check ~= nil then
		check = currentGrid[self.x - 1][self.y + 1]["material"]
	end
	
	return check
end

function Particle:checkLeftUp()
	local check = currentGrid[self.x - 1][self.y - 1]
	if check ~= nil then
		check = currentGrid[self.x - 1][self.y - 1]["material"]
	end
	
	return check
end

function Particle:checkRightUp()
	local check = currentGrid[self.x + 1][self.y - 1]
	if check ~= nil then
		check = currentGrid[self.x + 1][self.y - 1]["material"]
	end
	
	return check
end

function Particle:simulateGravity (densityCheck)
	local check
	local below = currentGrid[self.x][self.y - 1]
	densityCheck = densityCheck or false
	
	if self:checkDown() ~= nil and self.density > below.density then
		if densityCheck == false then
			currentGrid[self.x][self.y] = below
			below.y = below.y - 1
			self.y = self.y + 1
			currentGrid[self.x][self.y] = self
		end
		check = true
	else
		check = false
	end
	return check
end

function Particle:update()
	if self.cannotSimulate == false then
		self:simulateGravity()
		self.cannotSimulate = true
	end
end

function Particle:draw()
	love.graphics.setColor(self.red, self.green, self. blue, self.alpha)
	love.graphics.rectangle("fill", (x-1) * cellSize, (y-1) * cellSize, cellSize, cellSize)
end
		