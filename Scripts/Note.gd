extends Area2D

export var content = "Lorem ipsum dolor sit amet"

var hl

func _ready():
	hl = false

func activate():
	highlight()
	get_parent().get_node("Player").note(content)

func highlight():
	hl = !hl
	if hl: #change later
		$Sprite.frame = 1
	else:
		$Sprite.frame = 0
