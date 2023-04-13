local classic = require("libraries/classic")
local Desk = classic:extend()

local CD = require("objects/cd")
local cds = {}
for _, cd in pairs(require("libraries/booking").selectUniqueBooks(20)) do
	table.insert(cds, CD(love.math.random(deskSpawnPadding*2, (screenWidth - deskSpawnPadding)*2), love.math.random((shelfSize + deskSpawnPadding)*2, (screenHeight - deskSpawnPadding)*2), cd[1], cd[2], cd[3]))
end

function Desk:new ()

end

function Desk:draw ()
	-- Previously used to draw desk area
	-- love.graphics.setColor(24 / 255, 24 / 255, 37 / 255)
	-- love.graphics.rectangle("fill", 0, shelfSize*2, screenWidth*2, (screenHeight - shelfSize)*2)
	for _, cd in pairs(cds) do
		cd:draw()
	end
end

return Desk
