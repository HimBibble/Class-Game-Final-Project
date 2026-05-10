require "particle"


Powder = {}
Powder.__index = Powder
setmetatable(Powder, Particle)