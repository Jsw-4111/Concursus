extends Node
class_name CharacterInputHandler

@export var navigator: Navigator
@export var inputMapper: CharacterInputMapper

var isPreviewing = false

func _ready():
	navigator.terrain_Clicked.connect(handleTerrainClickEvent)
	inputMapper.right_click_event.connect(handleRightClick)
	inputMapper.left_click_event.connect(handleLeftClick)
	inputMapper.player_ability_event.connect(activateAbility)
	get_parent().set_preview_state.connect(setPreview)
	

func handleRightClick(position: Vector2):
	if isPreviewing:
		emitCancelAbility()
	else:
		navigateTo(position)

func handleLeftClick():
	if isPreviewing:
		emitConfirmAbility()

func navigateTo(position: Vector2):
	navigator.navigateTo(position)

signal move_player(target: Vector3)
func handleTerrainClickEvent(position: Vector3):
	move_player.emit(position)

signal activate_player_ability(index: int)
func activateAbility(index: int):
	activate_player_ability.emit(index)

signal cancelAbility
func emitCancelAbility():
	cancelAbility.emit()

signal confirmAbility
func emitConfirmAbility():
	confirmAbility.emit()

func setPreview(to: bool):
	print("Setting preview state")
	isPreviewing = to
