extends Node

class_name MainMenuEnums

enum MainMenuButtonTypes { Continue, NewGame, Settings }

static func getMainMenuButtonTypeFromName(name: String) -> MainMenuButtonTypes:
	match name:
		"ContinueButton":
			return MainMenuButtonTypes.Continue
		"NewGameButton":
			return MainMenuButtonTypes.NewGame
		"SettingsButton":
			return MainMenuButtonTypes.Settings
		_:
			push_warning("Tried to evaluate an unrecognized button in the main menu/n/n",
				"Button name was: ", name, "/nDefaulting to settings")
			return MainMenuButtonTypes.Settings
