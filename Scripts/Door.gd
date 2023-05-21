extends Area2D

export var leads = "res://Scenes/Rooms/Corridor1.tscn"
export(bool) var open = true

var hl

func activate():
	if open:
		highlight()
		get_node("AnimationPlayer").play("activate")
	else:
		get_node("SoundLocked").play()

func end():
# warning-ignore:return_value_discarded
	get_tree().change_scene(leads)

func highlight():
	if $Sprite.frame == 2:
		return
	hl = !hl
	if hl:
		$Sprite.frame = 1
	else:
		$Sprite.frame = 0
