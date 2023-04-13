local CD = require("objects/cd")
local Game = {}

Game.cds = {}
Game.slots = {}
for x = 0, 4 do
	for y = 0, 3 do
		posX = (x + 1) * screenWidth / 6
		posY = (y + 1) * shelfSize / 5
		table.insert(Game.slots, {posX - 16, posY - 3, 32, 6, true})
	end
end

local bellSprite = love.graphics.newImage("assets/sprites/bell.png")

function Game:mousepressed (x, y)
	
end

function Game:draw ()
	for _, slot in pairs(self.slots) do
		love.graphics.setColor(205 / 255, 214 / 255, 244 / 255)
		love.graphics.rectangle("fill", slot[1], slot[2], slot[3], slot[4])
		love.graphics.setColor(24 / 255, 24 / 255, 37 / 255)
		love.graphics.rectangle("fill", slot[1] + 1, slot[2] + 1, slot[3] - 2, slot[4] - 2)
		if slot[4] then
			love.graphics.setColor(205 / 255, 214 / 255, 244 / 255)
			love.graphics.rectangle("fill", slot[1] + 2, slot[2] + 2, slot[3] - 4, slot[4] - 4)
		end
	end

	love.graphics.setColor(24 / 255, 24 / 255, 37 / 255)
	love.graphics.rectangle("fill", 0, shelfSize, screenWidth, screenHeight - shelfSize)
	love.graphics.setColor(17 / 255, 17 / 255, 27 / 255)
	love.graphics.rectangle("fill", 0, screenHeight - 5, screenWidth, 5)
	for _, cd in pairs(self.cds) do
		cd:draw()
	end
	love.graphics.setColor(1, 1, 1)
	love.graphics.draw(bellSprite, 10, shelfSize - 10)
end

return Game
