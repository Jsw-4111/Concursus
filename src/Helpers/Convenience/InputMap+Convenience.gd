class_name InputMapConvenience

static func getPlayerActions():
	return InputMap.get_actions().filter(func(action):
		if action.contains("Player_Ability") or action.contains("Player_Item"):
			return
	)
