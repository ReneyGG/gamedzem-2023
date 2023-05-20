extends Area2D

var hl

func _ready():
	hl = false

func activate():
	get_node("AnimationPlayer").play("activate")

func highlight():
	hl = !hl
	if hl: #change later
		$Sprite.frame = 1
	else:
		$Sprite.frame = 0
