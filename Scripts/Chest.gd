extends Area2D

onready var sprite = get_node("AnimatedSprite")

var hl

func _ready():
	hl = false

func activate():
	highlight()
	if sprite.frame == 0:
		sprite.frame = 1
	else:
		sprite.frame = 0

func highlight():
	hl = !hl
#	if hl:
#		$Sprite.frame = 1
#	else:
#		$Sprite.frame = 0
