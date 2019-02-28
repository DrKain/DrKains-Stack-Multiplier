-- Thanks to Noxy for the original mod, I figured it was time to update.

local baseStackMultiplier = settings.startup["DrKains_StackMultiplier-basemultiplier"].value

-- Changing these can crash the game...
local ignore = {
	["blueprint"]           = true,
	["blueprint-book"]      = true,
	["deconstruction-item"] = true,
	["selection-tool"]      = true,
	["item-with-inventory"] = true,
	["armor"]               = true,
	["upgrade-item"]		= true
}

-- loop through each item and apply the new stack size
for _, dat in pairs(data.raw) do
	for _,item in pairs(dat) do
		if item.stack_size and type(item.stack_size) == "number" then
			if not ignore[item.type] and (item.stackable == nil or item.stackable) then
				item.stack_size = item.stack_size * baseStackMultiplier
			end
		end
	end
end