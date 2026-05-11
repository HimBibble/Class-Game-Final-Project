require "world"



require "sand"
require "air"


cellSize = 20

currentGrid = {}





function love.load()

	world = World.new()

	--Make variables of canvas size to work with
	local canvasWidth = love.graphics.getWidth()
	local canvasHeight = love.graphics.getHeight()
	
	--Setting the grid size relative to canvas
	gridRows = canvasWidth / cellSize
	gridColumns = canvasHeight / cellSize

	currentGrid = world:createGrid(gridColumns, gridRows)
	
	
	currentGrid[5][5] = Sand:new(50, 50)
end

function love.update(dt)
	mouseX, mouseY = love.mouse.getPosition()
	
	mouseCellX = math.floor(mouseX / cellSize) + 1
	mouseCellY = math.floor(mouseY / cellSize) + 1
	
	

	world:updateWorld(currentGrid)
end

function love.draw()
	world:drawGrid(currentGrid)
end