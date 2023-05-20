extends Area2D

export(PackedScene) var leads = load("res://Scenes/Main.tscn")
export(bool) var open = true

var hl

func activate():
	if open:
		highlight()
		get_tree().change_scene_to(leads)

func highlight():
	hl = !hl
#	if hl:
#		$Sprite.frame = 1
#	else:
#		$Sprite.frame = 0
