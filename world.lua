World = {}
World.__index = World

function World.new(x, y)
	local instance = setmetatable({}, World)
	return instance
end

--Update the particles
function World:updateSimulation(world)
	local currentGrid = world
	local nextGrid = {}
	local rowUpdate = {}
	local columnUpdate = {}
	
	
end

--Create initial grid for the world
function World:createGrid(columns, rows)
	local grid = {}
	for x = 1, columns do
		grid[x] = {}
		for y = 1, rows do
			grid[x][y] = Air:new(x, y)
		end
	end
	
	
	--Returns the created grid
	return grid
end

function World:updateWorld(grid)
	local grid = grid
	
	
	--Iterates through the grid and updates each particle as needed
	for i, v in ipairs(grid) do
		for j, v2 in pairs(v) do
			if v2.material ~= "air" then
				local self = currentGrid[i][j]
				v2:updateParticle(i, j, currentGrid, self)
			end
		end
	end
	
end

--Makes every particle able to update after moving
function World:resetCanUpdate(grid)
	local grid = grid
	for i, v in ipairs(grid) do
		for j, v2 in pairs(v) do
			if v2 ~= 0 then
				if v2.material ~= "air" then
				end
				
				v2.canUpdate = true
				
			end
		end
	end
end


--These two functions check if the value is in bounds
function xInBounds(x)
	return x > 0 and x <= gridCols
end

function yInBounds(y)
	return y > 0 and y <= gridRows
end

function World:drawGrid(grid)
	local drawGrid = grid
	
	--Turns all of the existing grid into air
	for i, v in ipairs(drawGrid) do
		for j, v2 in pairs(v) do
			if v2.material ~= "air" then
				v2:draw(i, j)
			end
		end
	end
	
	--Draws a grid for debugging purposes
	if debugGrid == true then
		for i, row in ipairs(drawGrid) do
			for j, tile in ipairs(row) do
				love.graphics.setColor(255, 255, 255)
				love.graphics.rectangle("line", (j- 1) * cellSize, (i - 1) * cellSize, cellSize, cellSize)
			end
		end
	end
end


--Handles the placement of particles in the world
function World:placeParticle(grid, x, y, material)
	local grid = grid
	local x = x
	local y = y
	
	--Instances new particles based on selection
	if material == "sand" then
		grid[x][y] = Sand:new(x, y)
	elseif material == "air" then
		grid[x][y] = Air:new(x, y)
	elseif material == "gravel" then
		grid[x][y] = Gravel:new(x, y)
	elseif material == "water" then
		grid[x][y] = Water:new(x, y)
	end
end
