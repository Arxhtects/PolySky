extends Spatial

var collectResource = preload("res://Scenes/Collectable.tscn")
var floorResource = preload("res://Scenes/Floor.tscn")
var pillarResource = preload("res://Scenes/Pillar.tscn")
var pillar2Resource = preload("res://Scenes/Pillar_.tscn")
var lifepodResource = preload("res://Scenes/Lifepod.tscn")

#menus
var mainmenuResource = preload("res://Scenes/MainMenu.tscn")
var gameuiResource = preload("res://Scenes/GameUI.tscn")
var gameoverResource = preload("res://Scenes/GameOver.tscn")

onready var Score
onready var Life

func _ready():
	pass

func _on_SpawnBoxTimer_timeout():
	var Random = randi()%2+1
	var PosRandom = randi()%3+1
	var lifespawnRandom = randi()%50+1
	
	var collect = collectResource.instance()
	var pillar = pillarResource.instance()
	var pillar2 = pillar2Resource.instance()
	var lifespawn = lifepodResource.instance()
	
	var collectPos
	
	if Random == 2:
		if PosRandom == 1:
			if global.spawnedPillar == false:
				pillar.set_translation(Vector3(-2, -2, -34))
				pillar.rotate_y(179)
				add_child(pillar)
				global.spawnedPillar = true
				collectPos = Vector3(2, 0.5, -34)
			else:
				pillar2.set_translation(Vector3(1.6, -1.5, -34))
				pillar2.rotate_y(-230)
				add_child(pillar2)
				global.spawnedPillar = false
				collectPos = Vector3(-2, 0.5, -34)
				
			if lifespawnRandom == 25:
				lifespawn.set_translation(collectPos)
				add_child(lifespawn)
			else:
				collect.set_translation(collectPos)
				add_child(collect)
				
		elif PosRandom == 2:
			if global.spawnedPillar_ == false:
				pillar2.set_translation(Vector3(1.6, -1.5, -34))
				pillar2.rotate_y(-230)
				add_child(pillar2)
				global.spawnedPillar_ = true
				collectPos = Vector3(-2, 0.5, -34)
			else:
				pillar.set_translation(Vector3(-2, -2, -34))
				pillar.rotate_y(179)
				add_child(pillar)
				global.spawnedPillar_ = false
				collectPos = Vector3(2, 0.5, -34)
			
			if lifespawnRandom == 20:
				lifespawn.set_translation(collectPos)
				add_child(lifespawn)
			else:
				collect.set_translation(collectPos)
				add_child(collect)
				
		elif PosRandom == 3:
			if lifespawnRandom == 20:
				lifespawn.set_translation(Vector3(0, 0.5, -34))
				add_child(lifespawn)
			else:
				collect.set_translation(Vector3(0, 0.5, -34))
				add_child(collect)

func _on_SpawnFloorTimer_timeout():
	var floorR = floorResource.instance()
	floorR.set_translation(Vector3(0, -1, -48.343353))
	add_child(floorR)

#game update
func mainmenu():
	var mainmenu = mainmenuResource.instance()
	add_child(mainmenu)

func mainmenu_restart():
	get_tree().reload_current_scene()
	get_tree().paused = true
	var mainmenu = mainmenuResource.instance()
	add_child(mainmenu)
	global.score = 0
	global.lives = 3

func Gameover():
	get_node("/root/Main/Game").queue_free()
	get_tree().paused = true
	var gameover = gameoverResource.instance()
	add_child(gameover)

func restart():
	get_tree().paused = false
	get_tree().reload_current_scene()
	var gameui = gameuiResource.instance()
	add_child(gameui)
	global.score = 0
	global.lives = 3

func add_gameui():
	var gameui = gameuiResource.instance()
	add_child(gameui)

func play():
	get_tree().paused = false
	
func pause():
	get_tree().paused = true
	
#game functions
func updatescore():
	Score = get_node("/root/Main/Game/Score") #called like this to allow reload
	Score.text = str(global.score)

func updatelife():
	Life = get_node("/root/Main/Game/Life") #called like this to allow reload
	Life.text = str(global.lives)
	if global.lives == 0:
		Gameover()