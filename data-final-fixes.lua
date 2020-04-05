-- Please edit settings ingame unless you know what you are doing.
local baseStackMultiplier = settings.startup["DrKains_StackMultiplier-baseStackMultiplier"].value
local constructRobotStackMultiplier = settings.startup["DrKains_StackMultiplier-constructRobotStackMultiplier"].value
local logicRobotStackMultiplier = settings.startup["DrKains_StackMultiplier-logicRobotStackMultiplier"].value
local stackSingles = settings.startup["DrKains_StackMultiplier-stackSingles"].value

-- Changing these can crash the game or cause bugs.
-- If you feel like one of these options should be modified, Please
-- let me know on github.
local ignore = {
    ["blueprint"] = true,
    ["blueprint-book"] = true,
    ["deconstruction-item"] = true,
    ["selection-tool"] = true,
    ["item-with-inventory"] = true,
    ["armor"] = true,
    ["upgrade-item"] = true
}

-- loop through each item and apply the new stack size
for _, dat in pairs(data.raw) do
	for _,item in pairs(dat) do
		if item.stack_size and type(item.stack_size) == "number" then
			-- Skip ignored/blacklisted items
			if not ignore[item.type] == true and (item.stackable == nil or item.stackable) then
				Multi = baseStackMultiplier
				-- Stacking single stack items can cause problems, IE Item loss or instability
				if stackSingles == false and item.stack_size == 1 then
					Multi = 1
				end
				item.stack_size = item.stack_size * Multi
			end
		end
	end
end

-- Construct Robots
for _, v in pairs(data.raw["construction-robot"]) do
    v.max_payload_size = v.max_payload_size * constructRobotStackMultiplier
end

-- Logic Robots
for _, v in pairs(data.raw["logistic-robot"]) do
    v.max_payload_size = v.max_payload_size * logicRobotStackMultiplier
end
