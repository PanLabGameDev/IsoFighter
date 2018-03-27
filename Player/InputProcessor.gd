extends Node

onready var player = get_parent()

func handle_action(action):
	player.handle_action(action)
"""
func _input(event):
	if event.is_echo():
		return

	if event is InputEventKey:
		match event.scancode:
			KEY_W:
				handle_action(Accelerate, event.is_pressed(), true)
			KEY_S:
				handle_action(Brake, event.is_pressed(), true)
			KEY_A:
				handle_action(Steer, -1 if event.is_pressed() else 1, true)
			KEY_D:
				handle_action(Steer, 1 if event.is_pressed() else -1, true)
			KEY_SPACE:
				handle_action(Handbrake, event.is_pressed(), true)
			KEY_SHIFT:
				handle_action(Boost, event.is_pressed(), true)

	elif event is InputEventJoypadButton:
		match event.button_index:
			JOY_XBOX_A:
				pass
			JOY_L:
				handle_action(Handbrake, event.is_pressed())
			JOY_XBOX_X:
				handle_action(Handbrake, event.is_pressed())
			JOY_XBOX_B:
				handle_action(Boost, event.is_pressed())

	elif event is InputEventJoypadMotion:
		match event.axis:
			0: # left stick x-axis
				var axis_value = abs(event.axis_value)
				var axis_value_sign = sign(event.axis_value)

				if axis_value < controller_stick_deadzone:
					axis_value = 0
				else:
					axis_value = range_lerp(axis_value, controller_stick_deadzone, 1, 0, 1)

				axis_value = axis_value * axis_value_sign
				handle_action(Steer, axis_value)
			6: # left trigger
				handle_action(Brake, event.axis_value)
			7: # right trigger
				handle_action(Accelerate, event.axis_value)
"""
