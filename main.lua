require "world"
require "sand"


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
end

function love.update(dt)
	world:updateWorld(currentGrid)
end

function love.draw()
	world:drawGrid(currentGrid)
end