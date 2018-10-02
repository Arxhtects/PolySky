extends Area

var speed = global.speed

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta): 
	global_translate(Vector3(0, 0, delta * speed))
	rotate_y(deg2rad(130 * delta))
	rotate_x(deg2rad(130 * delta))
	

func _on_Box_body_entered(body):
	if body is KinematicBody:
		queue_free()
