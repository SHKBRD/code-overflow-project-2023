return {
	selectUniqueBooks = function (count)
		local result = {}
		local data = require("assets/books")
		while #result < count do
			local randomValue = data[love.math.random(#data)]
			local used = false
			for i = 1, #result do
				if result[i] == value then
					used = true
				end
			end
			if not used then
				table.insert(result, randomValue)
			end
		end
		return result
	end	
}
