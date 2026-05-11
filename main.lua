require "world"



require "sand"
require "air"


cellSize = 20
updateNum = 0
currentGrid = {}
local material = "air"

debugGrid = false


function love.load()

	world = World.new()

	--Make variables of canvas size to work with
	 canvasWidth = love.graphics.getWidth()
	 canvasHeight = love.graphics.getHeight()
	
	--Setting the grid size relative to canvas
	gridRows = canvasWidth / cellSize
	gridColumns = canvasHeight / cellSize

	currentGrid = world:createGrid(gridColumns, gridRows)
	
	

end

function love.update(dt)
	-- mouseX, mouseY = love.mouse.getPosition()
	
	-- mouseCellX = math.floor(mouseX / cellSize) + 1
	-- mouseCellY = math.floor(mouseY / cellSize) + 1
	
	
	
	world:updateWorld(currentGrid)
	
	
	local mouseX, mouseY = love.mouse.getPosition()
	
	local mouseCellX = math.floor(mouseX / cellSize) + 1
	local mouseCellY = math.floor(mouseY / cellSize) + 1
	if love.mouse.isDown(1) then
		world:placeParticle(currentGrid, mouseCellX, mouseCellY, material)
	end
	
	
	--Enable Grid
	if love.keyboard.isDown("s") and debugGrid == false then
		debugGrid = true
	elseif love.keyboard.isDown("h") and debugGrid == true then
		debugGrid = false
	end
	
	
	--Material Selection
	if love.keyboard.isDown(1) then
		material = "air"
	elseif love.keyboard.isDown(2) then
		material = "sand"
	end
end

function love.draw()
	world:drawGrid(currentGrid)
	
	love.graphics.setColor(255, 255, 30)
	love.graphics.print("Current Material is: " .. material, 0, 0, 0, 2, 2)
end