extends Node3D

class_name ActionBase

var target: Node3D
var parent: Node3D

func destruct():
	self.get_parent().remove_child(self)
	self.queue_free()

signal action_started
func signalStart():
	action_started.emit()

signal action_completed
func signalCompletion():
	action_completed.emit()

# This method, and its extended counterparts, should be used as a factory method to contruct an
# instance of the class they are defined in.
static func create() -> ActionBase:
	var newAction = ActionBase.new()
	newAction.signalStart()
	return newAction
