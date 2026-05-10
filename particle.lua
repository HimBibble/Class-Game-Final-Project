Particle = {}
Particle.__index = Particle

function Particle:printCoords()
	love.graphics.print(self.x)
	love.graphics.print(self.y)
end

