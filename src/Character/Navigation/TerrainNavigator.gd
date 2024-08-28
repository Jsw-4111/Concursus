extends StaticBody3D

class_name TerrainNavigator

@onready var playerCamera := $"../Character/Camera3D" as Camera3D

signal terrain_Clicked(pos: Vector3)
func _input(event: InputEvent) -> void:
	if (event is InputEventMouseButton and 
		event.button_index == MOUSE_BUTTON_RIGHT and 
		event.pressed):
		var pointStart = playerCamera.project_ray_origin(event.position)
		var pointEnd = pointStart + playerCamera.project_ray_normal(event.position) * 1000.0
		
		var nearestPointOnMesh := NavigationServer3D.map_get_closest_point_to_segment(
			get_world_3d().navigation_map,
			pointStart,
			pointEnd
		)
		
		terrain_Clicked.emit(nearestPointOnMesh)
