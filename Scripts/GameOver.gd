extends Container

func _ready():
	pass

func _on_Restart_button_down():
	Main.restart()
	get_parent().remove_child(self)

func _on_MainMenu_button_down():
	Main.mainmenu_restart()
	get_parent().remove_child(self)