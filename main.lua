require "world"


--Particles
require "sand"
require "air"
require "gravel"


cellSize = 20
local updateNum = 0
currentGrid = {}
local material = "air"
local updateRate = 0
local gamePaused = false
debugGrid = false


function love.load()

	world = World.new()

	--Make variables of canvas size to work with
	 canvasWidth = love.graphics.getWidth()
	 canvasHeight = love.graphics.getHeight()
	
	--Setting the grid size relative to canvas
	gridRows = canvasWidth / cellSize
	gridColumns = canvasHeight / cellSize

	--Make world based on size of canvas
	currentGrid = world:createGrid(gridColumns, gridRows)
	
	

end


function love.update(dt)
	
	--In case I need a clock
	updateNum = updateNum + dt
	updateNum = 0
	
	--Get mouse stuff for placing particles
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
	
	--Pause Simulation
	
	
	--Material Selection
	if love.keyboard.isDown(1) then
		material = "air"
	elseif love.keyboard.isDown(2) then
		material = "sand"
	elseif love.keyboard.isDown(3) then
		material = "gravel"
	end
	
	--Basically the game loop
	if updateNum >= 0 and gamePaused == false then
		world:updateWorld(currentGrid)
		world:resetCanUpdate(currentGrid)
	end

	
end

function love.draw()
	--Draws the world grid
	world:drawGrid(currentGrid)
	
	love.graphics.setColor(255, 255, 30)
	--Shows the player what material they have selected
	love.graphics.print("Current Material is: " .. material, 0, 0, 0, 2, 2)
end

--Handles the input for pausing the game
function love.keypressed(key)
	if key == "p" and gamePaused == false then
		gamePaused = true
	elseif key == "p" and gamePaused == true then
		gamePaused = false
	end
		
end
function love.keypressed(key)
	if key == "c" and gamePaused == false then
		currentGrid = world:createGrid(gridColumns, gridRows)
	end
		
end