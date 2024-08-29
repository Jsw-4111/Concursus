extends Node
class_name CharacterInputHandler

@export var navigator: Navigator
@export var inputMapper: CharacterInputMapper

func _ready():
	navigator.terrain_Clicked.connect(handleTerrainClickEvent)
	inputMapper.right_click_event.connect(navigateTo)

func navigateTo(position: Vector2):
	navigator.navigateTo(position)

signal move_player(target: Vector3)
func handleTerrainClickEvent(position: Vector3):
	move_player.emit(position)

signal activate_player_ability(index: int)
func activateAbility(index: int):
	activate_player_ability.emit(index)
