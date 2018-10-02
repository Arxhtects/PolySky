extends KinematicBody

var speed = 350
var direction = Vector3()
var screenWidth = ProjectSettings.get_setting("display/window/size/width")

func _ready():
	pass
	
func _physics_process(delta):
	direction = Vector3(0, 0, 0)
	if Input.is_action_pressed("ui_right"):
		if translation < Vector3(2.430556, 0, 0):
			direction.x += 1
			rotation.z += 0.02
		else:
			print()
	if Input.is_action_pressed("ui_left"):
		if translation > Vector3(-2.430556, 0, 0):
			direction.x -= 1
			rotation.z -= 0.02
		else:
			print()
	direction = direction.normalized()
	direction = direction * speed * delta
	move_and_slide(direction, Vector3(0, 1, 0))