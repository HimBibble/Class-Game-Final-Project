function placeParticle(x, y, partType)

	local mX = x
	local mY = y
	local placeColumn = math.floor(mX / cellSize) + 1
	local placeRow = math.floor(mY / cellSize) + 1
	
	
	if currentGrid[x][y] ~= partType then
		local particle = Sand(placeColumn, placeRow)
	end
end