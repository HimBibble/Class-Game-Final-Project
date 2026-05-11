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
	

	for i, v in ipairs(grid) do
		for j, v2 in pairs(v) do
			if v2.material ~= "air" then
				v2:updateParticle(i, j, currentGrid)
			end
		end
	end
	
	
	
end



function xInBounds(x)
	return x > 0 and x <= gridCols
end

function yInBounds(y)
	return y > 0 and y <= gridRows
end

function World:drawGrid(grid)
	local drawGrid = grid
	
	
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

function World:placeParticle(grid, x, y, material)
	local grid = grid
	local x = x
	local y = y
	if material == "sand" then
		grid[x][y] = Sand:new(x, y)
	elseif material == "air" then
		grid[x][y] = Air:new(x, y)
	end
end
