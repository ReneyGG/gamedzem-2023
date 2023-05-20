extends Area2D

export(NodePath) var leads = "res://Scenes/Main.tscn"
var hl

func _ready():
	hl = false

func activate():
	get_node("Sound").play()
	get_node(leads).activate()
	self.monitorable = false

func highlight():
	hl = !hl
#	if hl: #change later
#		$Sprite.frame = 1
#	else:
#		$Sprite.frame = 0
