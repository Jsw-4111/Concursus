extends Node

var actions: Array[ActionBase] = []
var currentAction: ActionBase = null

func queueAction(action: ActionBase):
	actions.append(action)
	
	if actions.size() == 1:
		startAction()

func startAction():
	if currentAction == null:
		currentAction = actions.pop_front()
		currentAction.create()
		currentAction.action_completed.connect(stopAction)

func stopAction():
	currentAction.destruct()
	currentAction = null
	if actions.size() > 0:
		startAction()

func clearActions():
	for action in actions:
		action.queue_free()
	
	actions.clear()
