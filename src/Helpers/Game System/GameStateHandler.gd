extends Node

var gameState = GameStates.paused
enum GameStates {
	unpaused,
	paused
}

var combatState = CombatStates.outOfCombat
enum CombatStates {
	startingCombat,
	combatPhase,
	planningPhase,
	outOfCombat
}

func _ready():
	EventBus.connect("start_combat", start_combat)
	EventBus.connect("exit_combat", start_combat)
	EventBus.connect("pause", start_combat)
	EventBus.connect("resume", start_combat)
	EventBus.connect("planning_phase_started", start_combat)
	EventBus.connect("planning_phase_ended", start_combat)
	EventBus.connect("combat_phase_started", start_combat)
	EventBus.connect("combat_phase_ended", start_combat)

func start_combat():
	combatState = CombatStates.startingCombat

func exit_combat():
	combatState = CombatStates.outOfCombat

func pause():
	combatState = GameStates.paused

func resume():
	combatState = GameStates.unpaused

func planning_phase_started():
	combatState = CombatStates.planningPhase

func combat_phase_started():
	combatState = CombatStates.combatPhase
