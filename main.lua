love.graphics.setDefaultFilter("nearest", "nearest")
love.graphics.setFont(love.graphics.newFont("assets/m5x7.ttf", 16))

screenWidth = love.graphics.getWidth() / 2
screenHeight = love.graphics.getHeight() / 2
shelfSize = screenHeight / 2
deskSpawnPadding = 20

local Post = require("libraries/postprocess")
local Cursor = require("objects/cursor")
local Game = require("objects/game")
local Desk = require("objects/desk")

function love.update (deltaTime)

end

function love.draw ()
	Post:push()
	Game:draw()
	Post:pop()
	Desk:draw()
end

function love.mousepressed (x, y, button, istouch, presses)
	Game:mousepressed(x, y, button)
	smallestDistance = 100
	if Cursor.heldCD then
		for _, cd in pairs(Game.cds) do
			distance = math.sqrt((cd.x - Cursor.x)^2 + (cd.y - Cursor.y)^2)
			print(distance)
			if distance < smallestDistance and distance < 20 then
				smallestDistance = distance
				Cursor.heldCD = cd
			end
		end
	end
end

function love.mousemoved (x, y, dx, dy, istouch)
	Cursor.x = x / 2
	Cursor.y = y / 2
	if Cursor.heldCD then
		Cursor.heldCD.x = Cursor.heldCD.x + dx / 2
		Cursor.heldCD.y = Cursor.heldCD.y + dy / 2
	end
end

function love.mousereleased (x, y, button, istouch, presses)
	Cursor.heldCD = nil
end
