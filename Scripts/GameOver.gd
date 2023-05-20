extends Control


func _ready():
	get_node("AnimationPlayer").play("fade_out")

func _on_TextureButton_pressed():
	get_tree().change_scene("res://Scenes/Rooms/Room1.tscn")
