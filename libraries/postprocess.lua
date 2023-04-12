local Post = {}
local screenCanvas = love.graphics.newCanvas(screenWidth, screenHeight)

function Post:push ()
	love.graphics.setCanvas(screenCanvas)
	love.graphics.clear(30 / 255, 30 / 255, 46 / 255)
end

function Post:pop ()
	love.graphics.setCanvas()
	love.graphics.setColor(1, 1, 1)
	love.graphics.draw(screenCanvas, 0, 0, 0, 2, 2)
end

return Post
