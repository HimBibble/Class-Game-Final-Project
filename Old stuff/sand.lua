Sand = Particle:extend()

function Sand:new(x, y)
	local rng = math.random()
	Sand.super.new(self, x, y, cellSize, cellSize, 255, 255, 0, 255)
	self.density = 10
	self.type = "sand"
	
end
	