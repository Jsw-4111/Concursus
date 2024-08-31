extends Node

var _playerActions: Dictionary

func _ready():
	_populatePlayerActions()

func _populatePlayerActions():
	for action in InputMap.get_actions():
		if action.begins_with("Player_Ability_") or action.begins_with("Player_Item_"):
			_playerActions.get_or_add(InputMap.action_get_events(action)[0].as_text().split(" ")[0],
										action)
	print(_playerActions.keys())

func isPlayerItem(event: InputEvent) -> bool:
	return _playerActions.get(event.as_text()).begins_with("Player_Item_")

func isPlayerAbility(event: InputEvent) -> bool:
	return _playerActions.get(event.as_text()).begins_with("Player_Ability_")

func getEventIndex(event: InputEvent) -> int:
	return _playerActions.get(event.as_text()).split("_")[2].to_int()
