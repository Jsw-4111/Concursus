extends Node

var button;

func _ready():
	button = get_parent()
	
	match typeof(button):
		"RichTextLabel":
			pass
		_:
			push_warning("Tried to create a button from an unhandled node type/n/n",
				"Tree location of the element is: ", button.get_path())
		
	
	button.connect("was_clicked", onClick)

func onClick():
	print("OnClick signal received")
	
