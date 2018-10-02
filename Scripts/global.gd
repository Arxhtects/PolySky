extends Node

onready var MainMenu
onready var Overlay
onready var PlayPause
onready var GameVars

var speed = 8
var score = 0 
var lives = 3
var spawnedPillar = false
var spawnedPillar_ = false
var gamestart = true

func _ready():
	gamestart()

func gamestart():
	if (gamestart == true):
		MainMenu = get_node("/root/Main/GUI/MainMenu")
		Overlay = get_node("/root/Main/GUI/Overlay")
		MainMenu.show()
		Overlay.show()
		get_tree().paused = true
		print("true")
	elif(gamestart == false):
		PlayPause = get_node("/root/Main/GUI/Pause/PausePlay")
		GameVars = get_node("/root/Main/GUI/Game")
		PlayPause.show()
		GameVars.show()
		get_tree().paused = false
		print("false")