extends RichTextLabel

func _ready():
	add_theme_constant_override("shadow_outline_size", 10)
	self.mouse_entered.connect(onHover)
	self.mouse_exited.connect(stoppedHovering)

func _gui_input(event):
	var mouseEvent := event as InputEventMouseButton
	if mouseEvent && mouseEvent.button_index == 1 && !mouseEvent.pressed:
		onClick()

func onHover():
	add_theme_color_override("font_shadow_color", Color(0.1, 0.1, 0.1))

func stoppedHovering():
	remove_theme_color_override("font_shadow_color")

signal was_clicked
func onClick():
	was_clicked.emit()
