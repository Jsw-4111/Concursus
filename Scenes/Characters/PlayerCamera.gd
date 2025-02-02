extends Camera3D

@export var character: CharacterBody3D

var cameraDistance
func _ready():
	cameraDistance = Vector3(0, 5, 5)

func _physics_process(delta: float) -> void:
	global_position = global_position.lerp(character.global_position + cameraDistance, delta * 16)
	look_at(character.global_position)
	
