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