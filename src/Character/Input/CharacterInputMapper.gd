extends Node
class_name CharacterInputMapper

func _input(event: InputEvent) -> void:
	if eventIsRightClick(event):
		right_click_event.emit(event.position)
	if eventIsPlayerAction(event):
		player_action_event.emit(0)

signal right_click_event(position: Vector2)
func eventIsRightClick(event: InputEvent) -> bool:
	if (event is InputEventMouseButton and 
		event.button_index == MOUSE_BUTTON_RIGHT and 
		event.pressed):
		return true
	return false

signal player_action_event(index: int)
func eventIsPlayerAction(event: InputEvent) -> bool:
	var eventAction = event as InputEventAction
	if not eventAction:
		return false
	if InputMapConvenience.getPlayerActions().has(eventAction.action):
		return true
	return false
