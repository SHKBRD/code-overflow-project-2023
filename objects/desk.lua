local classic = require("libraries/classic")
local Desk = classic:extend()

local Book = require("objects/book")
local books = {}
for _, book in pairs(require("libraries/booking").selectUniqueBooks(20)) do
	table.insert(books, Book(love.math.random(deskSpawnPadding, screenWidth - deskSpawnPadding), love.math.random(shelfSize + deskSpawnPadding, screenHeight - deskSpawnPadding), book[1], book[2], book[3]))
end

function Desk:new ()

end

function Desk:draw ()
	love.graphics.setColor(24 / 255, 24 / 255, 37 / 255)
	love.graphics.rectangle("fill", 0, shelfSize, screenWidth, screenHeight - shelfSize)
	for _, book in pairs(books) do
		book:drawOnDesk()
	end
end

return Desk
