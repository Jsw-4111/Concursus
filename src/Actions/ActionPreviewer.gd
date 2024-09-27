extends Node3D

class_name ActionPreviewer

var action: ActionBase
var animationPlayer: AnimationPlayer
var camera: Camera3D

static func createPreviewer(action: ActionBase, camera: Camera3D) -> ActionPreviewer:
	var actionPreviewer = ActionPreviewer.new()
	actionPreviewer.action = action
	actionPreviewer.add_child(action.getPreviewAnimation())
	actionPreviewer.camera = camera
	
	return actionPreviewer

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		var spaceState = get_world_3d().direct_space_state 
		
		var pointStart = camera.project_ray_origin(event.position)
		var pointEnd = pointStart + camera.project_ray_normal(event.position) * 100.0
		var query = PhysicsRayQueryParameters3D.create(pointStart, pointEnd)
		query.collide_with_areas = true
		
		var result = spaceState.intersect_ray(query)
		
		if result:
			print(result.position.x, result.position.y, result.position.z)
			self.global_position.x = result.position.x
			self.global_position.y = result.position.y
			self.global_position.z = result.position.z
