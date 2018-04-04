extends KinematicBody

var movement = Vector3()
var speed = 0.1


const SPEED = 6
const ACCELERATION = 3
const DE_ACCELERATION = 5
var velocity = Vector3()
#var dir = Vector3()
#var is_moving = false
var gravity = -9.8
var camera
var skip_echo = false

func _ready():
	camera = get_node("/root/Game/Camera").get_global_transform()

func _physics_process(delta):
#	move_and_collide(movement.normalized() * speed)

	var dir = Vector3()

	var is_moving = false
	var is_hitting = false

	if(Input.is_key_pressed(KEY_W)):
		dir += -camera.basis[2]
		is_moving = true
	if(Input.is_key_pressed(KEY_S)):
		dir += camera.basis[2]
		is_moving = true
	if(Input.is_key_pressed(KEY_A)):
		dir += -camera.basis[0]
		is_moving = true
	if(Input.is_key_pressed(KEY_D)):
		dir += camera.basis[0]
		is_moving = true

	if(Input.is_key_pressed(KEY_SPACE)):
		is_hitting = true

	dir.y = 0
	dir = dir.normalized()

	velocity.y += delta * gravity

	var hv = velocity
	hv.y = 0

	var new_pos = dir * SPEED
	var accel = DE_ACCELERATION

	if (dir.dot(hv) > 0):
		accel = ACCELERATION

	hv = hv.linear_interpolate(new_pos, accel * delta)

	velocity.x = hv.x
	velocity.z = hv.z

	velocity = move_and_slide(velocity, Vector3(0,1,0))

	if is_moving:

		# Rotate the player to direction
		var angle = atan2(hv.x, hv.z)

		var char_rot = self.get_rotation()

		char_rot.y = angle
		self.set_rotation(char_rot)

	if is_hitting:
		get_node("AnimationPlayer").play("hit")

#	var speed = hv.length() / SPEED


func _input2(event):
	var dir = Vector3()
	var is_moving = false


	# its better to process the echos, otherwise input is lost if pressed multible keys at once
	if skip_echo and event.is_echo():
		return

	if event is InputEventKey and event.is_pressed():
		match event.scancode:
			KEY_W:
				dir += -camera.basis[2]
				is_moving = true
			KEY_S:
				dir += camera.basis[2]
				is_moving = true
			KEY_A:
				dir += -camera.basis[0]
				is_moving = true
			KEY_D:
				dir += camera.basis[0]
				is_moving = true

	if is_moving:
		dir.y = 0
		dir = dir.normalized()


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
			KEY_T:
				if event.is_pressed():
					skip_echo = !skip_echo
