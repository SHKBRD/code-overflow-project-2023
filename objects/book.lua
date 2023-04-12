local classic = require("libraries/classic")
local Book = classic:extend()

local bookColors = {
	{245 / 255, 224 / 255, 220 / 255},
	{242 / 255, 205 / 255, 205 / 255},
	{245 / 255, 194 / 255, 231 / 255},
	{203 / 255, 166 / 255, 247 / 255},
	{243 / 255, 139 / 255, 168 / 255},
	{235 / 255, 160 / 255, 172 / 255},
	{250 / 255, 179 / 255, 135 / 255},
	{249 / 255, 226 / 255, 175 / 255},
	{166 / 255, 227 / 255, 161 / 255},
	{148 / 255, 226 / 255, 213 / 255},
	{137 / 255, 220 / 255, 235 / 255},
	{116 / 255, 199 / 255, 236 / 255},
	{137 / 255, 180 / 255, 250 / 255},
	{180 / 255, 190 / 255, 254 / 255}
}

function Book:new (x, y, author, title, pageNum)
	self.x = x
	self.y = y
	self.author = author
	self.title = title
	self.pageNum = pageNum
	
	self.thickness = math.max(1, math.floor(pageNum / 50))
	self.rotation = love.math.random() * math.pi / 2 - math.pi / 4
	self.color = bookColors[love.math.random(1, #bookColors)]
end

function Book:drawOnDesk ()
	for i = 0, self.thickness, 1 do
		love.graphics.push()
		love.graphics.translate(self.x, self.y - i)
		love.graphics.rotate(self.rotation)
		if i == 0 or i == self.thickness then
			love.graphics.setColor(self.color)
			love.graphics.rectangle("fill", 0, 0, 15, 20)
			love.graphics.setColor(186 / 255, 194 / 255, 222 / 255)
			love.graphics.rectangle("fill", 2, 2, 11, 3)
		else
			love.graphics.setColor(186 / 255, 194 / 255, 222 / 255)
			love.graphics.rectangle("fill", 0, 0, 15, 20)
			love.graphics.setColor(self.color)
			love.graphics.rectangle("fill", 0, 0, 1, 20)
		end
		love.graphics.pop()
	end
end

return Book
