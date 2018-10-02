extends Area

var speed = global.speed

func _ready():
	pass

func _process(delta): 
	global_translate(Vector3(0, 0, delta * speed))
	rotate_y(deg2rad(130 * delta))


func _on_Collectable_body_entered(body):
	if body is KinematicBody:
		if (body.get_name() == "Player"):
			global.lives += 1
			GUI.updatelife()
			queue_free()
		else:
			queue_free()