extends Area2D

var hl

func _ready():
	hl = false

func activate():
	get_parent().get_node("Chandelier").activate()
	self.monitorable = false

func highlight():
	hl = !hl
	if hl: #change later
		$Sprite.frame = 1
	else:
		$Sprite.frame = 0
