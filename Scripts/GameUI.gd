extends Container

#preload images
var play_icon = preload("res://Asset/play.png")
var pause_icon = preload("res://Asset/pause.png")

#prepare onready vars for use in code
onready var PlayPause
onready var PausedText
onready var Overlay

var clicked = true

func _ready():
	pass

func _on_PausePlay_button_down():
	PlayPause = get_node("/root/Main/Game/Pause/PausePlay")
	PausedText = get_node("/root/Main/Game/Pause/PausedText")
	Overlay = get_node("/root/Main/Game/ColorRect")
	if clicked == true:
		Main.pause()
		PausedText.show()
		Overlay.show()
		PlayPause.set_button_icon(play_icon)
		clicked = false
	elif clicked == false:
		Main.play()
		PausedText.hide()
		Overlay.hide()
		PlayPause.set_button_icon(pause_icon)
		clicked = true