extends CharacterBody3D

const SPEED = 5

@export var nav_agent: NavigationAgent3D
@export var camera: Camera3D

var preview: ActionPreviewer

func _ready():
	var inputHandler := $"CharacterInputHandler" as CharacterInputHandler
	inputHandler.move_player.connect(setTargetPosition)
	inputHandler.activate_player_ability.connect(activateAbility)
	inputHandler.cancelAbility.connect(cancelAbility)

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	var direction: Vector3 = transform.origin.direction_to(nav_agent.get_next_path_position())
	direction.y = 0
	if direction and not nav_agent.is_navigation_finished():
		velocity = velocity.lerp(direction * SPEED, SPEED/2 * delta)
	else:
		velocity.x = 0
		velocity.z = 0
	move_and_slide()

func setTargetPosition(target: Vector3):
	nav_agent.set_target_position(target)

var currentAbility: int = 0
func activateAbility(index: int):
	if preview:
		return
	match index:
		1: # Column
			currentAbility = index
			preview = ActionPreviewer.createPreviewer(ColumnAbility.new(), camera)
			addPreview(preview)

func cancelAbility():
	currentAbility = 0
	if (preview):
		remove_child(preview)
		preview.queue_free()
	
	set_preview_state.emit(false)
	preview = null

func confirmAbility():
	cancelAbility()

signal set_preview_state(to: bool)
func addPreview(preview: ActionPreviewer):
	add_child(preview)
	set_preview_state.emit(true)
	
