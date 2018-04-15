extends Spatial

onready var player = get_parent()
onready var area = get_node("Area")

func _ready():
	area.connect("body_entered", self, "_on_body_entered")

func _on_body_entered(body):
	if body == self:
		return

	else:
		if player.is_attacking:
			print("hit ", body.name)
