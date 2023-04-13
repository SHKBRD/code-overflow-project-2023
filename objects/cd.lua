local classic = require("libraries/classic")
local CD = classic:extend()
local Cursor = require("objects/cursor")

function CD:new (x, y)
	self.x = x
	self.y = y
	self.radius = 15
end

function CD:draw ()
	for i = 0, 1, 1 do
		love.graphics.push()
		love.graphics.translate(self.x, self.y - i)
		love.graphics.scale(1, 0.5)
		if i == 1 then
			love.graphics.setColor(205 / 255, 214 / 255, 244 / 255)
			love.graphics.circle("fill", 0, 0, self.radius)
			love.graphics.setColor(24 / 255, 24 / 255, 37 / 255)
			love.graphics.circle("fill", 0, 0, 3)
			love.graphics.setColor(245 / 255, 224 / 255, 220 / 255)
			love.graphics.arc("fill", 0, 0, self.radius, 0, math.pi / 4)
			love.graphics.arc("fill", 0, 0, self.radius, math.pi, math.pi * 5/4)
		else
			love.graphics.setColor(108 / 255, 112 / 255, 134 / 255)
			love.graphics.circle("fill", 0, 0, self.radius)
		end
		love.graphics.pop()
	end
end

return CD
