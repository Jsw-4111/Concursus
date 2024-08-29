extends Node
class_name CharacterInputHandler

var navigator: Navigator
signal activate_player_ability(index: int)

func _ready():
	navigator = $"Navigator" as Navigator
	navigator.terrain_Clicked.connect(handleTerrainClickEvent)

func _input(event: InputEvent) -> void:
	if eventIsRightClick(event):
		navigator.navigateTo(event.position)

signal move_player(target: Vector3)
func handleTerrainClickEvent(position: Vector3):
	move_player.emit(position)

func eventIsRightClick(event: InputEvent) -> bool:
	if (event is InputEventMouseButton and 
		event.button_index == MOUSE_BUTTON_RIGHT and 
		event.pressed):
		return true
	return false
