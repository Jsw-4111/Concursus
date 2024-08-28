extends "../Button/ButtonOnClickHandler.gd"

var buttonType: MainMenuEnums.MainMenuButtonTypes

func _ready():
	super._ready()
	
	button = get_parent()
	MainMenuEnums.getMainMenuButtonTypeFromName(button.name)

func onClick():
	match buttonType:
		MainMenuEnums.MainMenuButtonTypes.Continue:
			get_tree().change_scene_to_file("res://Scenes/Levels/Test/test_level.tscn")
		MainMenuEnums.MainMenuButtonTypes.NewGame:
			get_tree().change_scene_to_file("res://Scenes/Levels/Test/test_level.tscn")
		MainMenuEnums.MainMenuButtonTypes.Settings:
			print("Clicked settings button on Main Menu")
