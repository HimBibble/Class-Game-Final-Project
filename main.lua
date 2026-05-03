local cellSize = 12

local mainGrid, gridUpdate, gridRows, gridCols

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

function love.load()

	--Make variables of canvas size to work with
	local canvasWidth = love.graphics.getWidth()
	local canvasHeight = love.graphics.getHeight()
	
	--Setting the grid size relative to canvas
	gridRows = canvasWidth / cellSize
	gridCols = canvasHeight / cellSize
	
	--Create starting grid
	mainGrid = createGrid(gridCols, gridRows)
end

function love.update(dt)
	mouseX, mouseY = love.mouse.getPosition()
	
	gridUpdate = createGrid(gridCols, gridRows)
	
	
	mainGrid = gridUpdate
	
end

function love.draw()
	love.graphics.print(mouseX, 0, 0)
	love.graphics.print(mouseY, 0, 25)
	
	for i, row in ipairs(mainGrid) do
		for j, tile in ipairs(row) do
			love.graphics.rectangle("line", j * cellSize, i * cellSize, cellSize, cellSize)
		end
	end
	
end