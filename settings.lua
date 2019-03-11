data:extend(
{
	{
		type = "int-setting",
		name = "DrKains_StackMultiplier-baseStackMultiplier",
		setting_type = "startup",
		minimum_value = 1,
		default_value = 10,
		maximum_value = 10000,
		order = "a-a"
	},
	{
		type = "int-setting",
		name = "DrKains_StackMultiplier-constructRobotStackMultiplier",
		setting_type = "startup",
		minimum_value = 1,
		default_value = 1,
		maximum_value = 10000,
		order = "a-b"
	},
	{
		type = "int-setting",
		name = "DrKains_StackMultiplier-logicRobotStackMultiplier",
		setting_type = "startup",
		minimum_value = 1,
		default_value = 1,
		maximum_value = 10000,
		order = "a-c"
	},
	{
		type = "bool-setting",
		name = "DrKains_stackMultiplier-satelliteStacking",
		setting_type = "startup",
		default_value = false,
		order = "b-a"
	}
}
)