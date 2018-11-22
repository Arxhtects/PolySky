extends CanvasLayer

func _ready():
	pass

func _on_MainMenu2_button_down():
	Main.play()
	Main.add_gameui()
	get_parent().remove_child(self)