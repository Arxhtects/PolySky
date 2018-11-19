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
		Main.mainmenu()
		get_tree().paused = true
	elif(gamestart == false):
		get_tree().paused = false