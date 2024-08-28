extends Node
class_name CharacterInputHandler

signal activate_player_ability(index: int)

func _ready():
	var sceneRoot = get_tree().current_scene
	var terrain := sceneRoot.get_node("Terrain") as TerrainNavigator
	terrain.terrain_Clicked.connect(handleTerrainClickEvent)

func _input(event: InputEvent) -> void:
	pass

signal move_player(target: Vector3)
func handleTerrainClickEvent(position: Vector3):
	move_player.emit(position)
