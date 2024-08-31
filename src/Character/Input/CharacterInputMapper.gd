extends Node
class_name CharacterInputMapper

func _input(event: InputEvent) -> void:
	if not event.is_pressed():
		return
	if eventIsRightClick(event):
		right_click_event.emit(event.position)
	elif InputMapConvenience.isPlayerAbility(event):
		player_ability_event.emit(InputMapConvenience.getEventIndex(event))
	elif InputMapConvenience.isPlayerItem(event):
		player_item_event.emit(InputMapConvenience.getEventIndex(event))
		

signal right_click_event(position: Vector2)
func eventIsRightClick(event: InputEvent) -> bool:
	return (event is InputEventMouseButton and 
			event.button_index == MOUSE_BUTTON_RIGHT)

signal player_item_event(index: int)
signal player_ability_event(index: int)
func eventIsPlayerAction(event: InputEvent) -> bool:
	return (event.is_action_type() and 
			InputMapConvenience.isPlayerAction(event))
