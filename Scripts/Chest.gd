extends Area2D

export var open = false

onready var sprite = get_node("AnimatedSprite")

var hl

func _ready():
	open = false
	hl = false

func activate():
	highlight()
	if sprite.frame == 0:
		sprite.frame = 1
		open = true
	else:
		sprite.frame = 0
		open = false

func highlight():
	hl = !hl
#	if hl:
#		$Sprite.frame = 1
#	else:
#		$Sprite.frame = 0
