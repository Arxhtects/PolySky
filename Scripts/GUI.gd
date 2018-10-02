extends CanvasLayer

#call assets for switching between
var play_icon = preload("res://Asset/play.png")
var pause_icon = preload("res://Asset/pause.png")

#prepare onready vars for use in code
onready var Score
onready var Life
onready var PlayPause
onready var PausedText
onready var Overlay
onready var GameOver
onready var GameVars
onready var MainMenu

func _ready():
	pass

func updatescore():
	Score = get_node("/root/Main/GUI/Game/Score") #called like this to allow reload
	Score.text = str(global.score)

func updatelife():
	Life = get_node("/root/Main/GUI/Game/Life")
	Life.text = str(global.lives)
	if global.lives == 0:
		GameOver = get_node("/root/Main/GUI/GameOver")
		PlayPause = get_node("/root/Main/GUI/Pause/PausePlay")
		Overlay = get_node("/root/Main/GUI/Overlay")
		get_tree().paused = true
		PlayPause.hide()
		Overlay.show()
		GameOver.show()

func _on_PausePlay_button_down():
	Overlay = get_node("/root/Main/GUI/Overlay")
	PausedText = get_node("/root/Main/GUI/Pause/PausedText")
	PlayPause = get_node("/root/Main/GUI/Pause/PausePlay")
	if get_tree().paused == false:
		get_tree().paused = true
		PlayPause.icon = play_icon
		PausedText.show()
		Overlay.show()
	elif get_tree().paused == true:
		get_tree().paused = false
		PlayPause.icon = pause_icon
		PausedText.hide()
		Overlay.hide()

func _on_Restart_button_down():
	get_tree().reload_current_scene()
	global.gamestart = false
	global.score = 0
	global.lives = 3
	global.gamestart()

func _on_MainMenu2_button_down():
	Overlay = get_node("/root/Main/GUI/Overlay")
	MainMenu = get_node("/root/Main/GUI/MainMenu")
	PlayPause = get_node("/root/Main/GUI/Pause/PausePlay")
	GameVars = get_node("/root/Main/GUI/Game")
	PlayPause.show()
	GameVars.show()
	MainMenu.hide()
	Overlay.hide()
	get_tree().paused = false

func _on_MainMenu_button_down():
	get_tree().reload_current_scene()
	global.gamestart = true
	global.score = 0
	global.lives = 3
	global.gamestart()
