extends Control


func _ready():
	get_node("AnimationPlayer").play("fade_out")

func _on_TextureButton_pressed():
	get_node("AnimationPlayer").play("fade_in")

func out():
	get_tree().change_scene("res://Scenes/Menu.tscn")
