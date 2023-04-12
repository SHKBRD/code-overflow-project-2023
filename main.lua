love.graphics.setDefaultFilter("nearest", "nearest")

screenWidth = love.graphics.getWidth() / 2
screenHeight = love.graphics.getHeight() / 2
shelfSize = screenHeight / 2
deskSpawnPadding = 20

local Post = require("libraries/postprocess")
local Cursor = require("objects/cursor")
local Shelf = require("objects/shelf")
local Desk = require("objects/desk")

function love.update (deltaTime)

end

function love.draw ()
	Post:push()
	Shelf:draw()
	Desk:draw()
	Post:pop()
end

function love.mousepressed (x, y, button, istouch, presses)

end

function love.mousereleased (x, y, button, istouch, presses)

end
