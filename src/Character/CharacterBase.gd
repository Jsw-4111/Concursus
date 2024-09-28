extends CharacterBody3D

const SPEED = 5.0

@export var nav_agent: NavigationAgent3D
@export var camera: Camera3D

var preview: ActionPreviewer

func _ready():
	var inputHandler := $"CharacterInputHandler" as CharacterInputHandler
	inputHandler.move_player.connect(setTargetPosition)
	inputHandler.activate_player_ability.connect(activateAbility)
	inputHandler.cancelAbility.connect(cancelAbility)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	var direction: Vector3 = transform.origin.direction_to(nav_agent.get_next_path_position())
	if direction and not nav_agent.is_navigation_finished():
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	move_and_slide()

func setTargetPosition(target: Vector3):
	nav_agent.set_target_position(target)

var currentAbility: int = 0
func activateAbility(index: int):
	print("Received ability index ", index)
	if preview:
		return
	print("Creating ability preview")
	match index:
		1: # Column
			currentAbility = index
			preview = ActionPreviewer.createPreviewer(ColumnAbility.new(), camera)
	add_child(preview)

func cancelAbility():
	currentAbility = 0
	remove_child(preview)
	preview.queue_free()
	preview = null

func confirmAbility():
	currentAbility = 0
	remove_child(preview)
	preview.queue_free()
	preview = null
