extends AbilityBase
class_name ColumnAbility

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

static func create() -> ColumnAbility:
	var ability = ColumnAbility.new()
	
	# init
	
	return ability

func getPreviewAnimation() -> MeshInstance3D:
	var mesh := MeshInstance3D.new()
	mesh.set_mesh(CylinderMesh.new())
	mesh.set_surface_override_material(0, preload("res://Assets/Materials/previewMaterial.tres"))
	
	return mesh
