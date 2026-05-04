Object = require("classic")

local cellSize = 20

local currentGrid, gridUpdate, gridRows, gridCols

math.randomseed(os.time())



--Function to create the initial grid.
local function createGrid(columns, rows)
	local grid = {}
	for x = 1, columns do
		grid[x] = {}
		for y = 1, rows do
			grid[x][y] = 0
		end 
	end
	--Returns the created grid
	return grid
end

local function gridXBounding(x)
	return x > 0 and x <= gridCols
end

local function gridYBounding(y)
	return y > 0 and y <= gridRows
end

function love.load()

	--Make variables of canvas size to work with
	local canvasWidth = love.graphics.getWidth()
	local canvasHeight = love.graphics.getHeight()
	
	--Setting the grid size relative to canvas
	gridRows = canvasWidth / cellSize
	gridCols = canvasHeight / cellSize
	
	--Create starting grid
	currentGrid = createGrid(gridCols, gridRows)
	
end

function love.update(dt)
	--Mouse stuff for debugging
	mouseX, mouseY = love.mouse.getPosition()
	
	--Create a new grid to push to the main grid for updates
	gridUpdate = createGrid(gridCols, gridRows)
	
	--For handling mouse snapping to grid
	local placeColumn = math.floor(mouseX / cellSize) + 1
	local placeRow = math.floor(mouseY / cellSize) + 1
	
	
	
	
	
	
	
	--Update grid with particle movement
	for x = 1, gridCols do
		for y = 1, gridRows do
			local state = currentGrid[x][y]
			
			if state == 1 then
				local below = currentGrid[x][y + 1]
				
				if below == 0 and y < gridCols then
					gridUpdate[x][y+1] = state
					gridUpdate[x][y] = 0
				else
					gridUpdate[x][y] = 1
				end
			end
		end
	end
	
	if love.mouse.isDown(1) then
		gridUpdate[placeColumn][placeRow] = 1
		
	end
	if love.mouse.isDown(2) then
		gridUpdate[placeColumn][placeRow] = 0
	end
	--Updates the main grid to the new grid
	currentGrid = gridUpdate
	
end



function love.draw()
	--Print mouse coords for debugging purposes
	love.graphics.setColor(255, 255, 0)
	love.graphics.print(mouseX, 0, 0)
	love.graphics.print(mouseY, 0, 10)
	
	
	love.graphics.print(currentGrid[1][1], 50)
	
	--Render visual grid for debugging
	for i, row in ipairs(currentGrid) do
		for j, tile in ipairs(row) do
			love.graphics.setColor(255, 255, 255)
			love.graphics.rectangle("line", (j - 1) * cellSize, (i - 1) * cellSize, cellSize, cellSize)
		end
	end
	
	--Render Particles
	for x = 1, gridCols do
		for y = 1, gridRows do
			if currentGrid[x][y] == 1 then
				love.graphics.setColor(255, 255, 0)
				
				love.graphics.rectangle("fill", (x-1) * cellSize, (y-1) * cellSize, cellSize, cellSize)
			end
		end
	end
	
end