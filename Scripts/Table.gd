class_name Table extends Area2D

var activated
var hl

func _ready():
	activated = false
	hl = false
	$Crouch1.hide()

func activate():
	activated = !activated
	$Crouch1.visible = activated

func highlight():
	hl = !hl
	if hl:
		$Sprite.frame = 1
	else:
		$Sprite.frame = 0
