extends Spatial

var collectResource = preload("res://Scenes/Collectable.tscn")
var floorResource = preload("res://Scenes/Floor.tscn")
var pillarResource = preload("res://Scenes/Pillar.tscn")
var pillar2Resource = preload("res://Scenes/Pillar_.tscn")
var lifepodResource = preload("res://Scenes/Lifepod.tscn")
	
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
