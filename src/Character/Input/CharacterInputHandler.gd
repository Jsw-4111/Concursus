extends Node
class_name CharacterInputHandler

signal activate_player_ability(index: int)

func _ready():
	var navigator := $"Navigator" as Navigator
	navigator.terrain_Clicked.connect(handleTerrainClickEvent)

func _input(event: InputEvent) -> void:
	pass

signal move_player(target: Vector3)
func handleTerrainClickEvent(position: Vector3):
	move_player.emit(position)
