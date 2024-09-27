extends Node3D

class_name ActionBase

var collider: CollisionObject3D
var target: Node3D
var parent: Node3D

func destruct():
	self.get_parent().remove_child(self)
	self.queue_free()

func getPreviewAnimation() -> MeshInstance3D:
	return MeshInstance3D.new()

# This method, and its extended counterparts, should be used as a factory method to contruct an
# instance of the class they are defined in.
static func create() -> ActionBase:
	var newAction = ActionBase.new()
	return newAction
