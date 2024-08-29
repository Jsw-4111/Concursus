extends Node3D

class_name Navigator

@export var playerCamera: Camera3D

signal terrain_Clicked(pos: Vector3)
func navigateTo(clickedPosition: Vector2):
	var pointStart = playerCamera.project_ray_origin(clickedPosition)
	var pointEnd = pointStart + playerCamera.project_ray_normal(clickedPosition) * 1000.0
	
	var nearestPointOnMesh := NavigationServer3D.map_get_closest_point_to_segment(
		get_world_3d().navigation_map,
		pointStart,
		pointEnd
	)
	
	terrain_Clicked.emit(nearestPointOnMesh)
