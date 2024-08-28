class_name ConfigHelper

const base_path = "user://"

var config = ConfigFile.new()
var name: String

func getConfig(configName: String):
	name = configName
	var temp = config.load(base_path + name)
	
	if temp:
		config = temp
	else:
		return

func addValue(section: String, key: String, value: Variant):
	config.set_value(section, key, value)

func saveConfig():
	config.save(base_path + name)
