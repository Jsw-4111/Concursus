extends CharacterBody3D

const SPEED = 5.0

@onready var nav_agent := $NavigationAgent3D as NavigationAgent3D

func _ready():
	var inputHandler := $"InputHandler" as CharacterInputHandler
	inputHandler.move_player.connect(setTargetPosition)

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
