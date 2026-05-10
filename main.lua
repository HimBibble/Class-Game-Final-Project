require "sand"




function love.load()
	sandTest = Sand.new(80, 20)
end

function love.update(dt)

end

function love.draw()
	love.graphics.print(sandTest.x, 0, 0)
	love.graphics.print(sandTest.y, 0, 25)
end