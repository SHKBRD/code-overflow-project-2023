local CD = require("objects/cd")
local Cursor = require("objects/cursor")
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
local bellSound = love.audio.newSource("assets/sounds/bell.mp3", "stream")

local Bell = {
	x = 10,
	y = shelfSize - 10,
	width = bellSprite:getWidth(),
	height = bellSprite:getHeight()
}

function Game:mousepressed (mx, my, button)
	if button == 1 then
		print("Click!")
	end

	--Over any cd
	if button == 2 then
		print("Right!")
	end

	--Bell clicked
	if mx/2 > Bell.x and mx/2 < Bell.x + Bell.width and my/2 > Bell.y and my/2 < Bell.y + Bell.height then
		bellSound:play()
	end
end

function Game:draw ()
	for _, slot in pairs(self.slots) do
		love.graphics.setColor(205 / 255, 214 / 255, 244 / 255)
		love.graphics.rectangle("fill", slot[1], slot[2], slot[3], slot[4])
		love.graphics.setColor(24 / 255, 24 / 255, 37 / 255)
		love.graphics.rectangle("fill", slot[1] + 1, slot[2] + 1, slot[3] - 2, slot[4] - 2)
		if slot[4] and not ((Cursor.x > slot[1]) and (Cursor.x < slot[1] + slot[3]) and (Cursor.y > slot[2]) and (Cursor.y < slot[2] + slot[4])) then
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
	love.graphics.draw(bellSprite, Bell.x, Bell.y)
end

return Game
