extends KinematicBody

var movement = Vector3()
var speed = 0.1

func _physics_process(delta):
	move_and_collide(movement.normalized() * speed)

func _input(event):
	if event.is_echo():
		return

	if event is InputEventKey:
		match event.scancode:
			KEY_W:
				movement.z = 1 if event.is_pressed() else 0
			KEY_S:
				movement.z = -1 if event.is_pressed() else 0
			KEY_A:
				movement.x = 1 if event.is_pressed() else 0
			KEY_D:
				movement.x = -1 if event.is_pressed() else 0