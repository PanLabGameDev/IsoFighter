extends Camera

onready var target = get_parent().get_node("Player")

# settings
var distance = 30

# members
var offset

func _ready():
	offset = (translation - target.translation).normalized() * distance

func _process(delta):
	translation = target.translation + offset
