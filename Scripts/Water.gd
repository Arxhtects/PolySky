extends Area

var speed = global.speed

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	global_translate(Vector3(0, 0, delta * speed))
	
	
func _on_Water_body_entered(body):
	if body is KinematicBody:
		queue_free()