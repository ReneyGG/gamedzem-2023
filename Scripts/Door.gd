extends Area2D

export(PackedScene) var leads = load("res://Scenes/Main.tscn")

func activate():
	print("door")
	get_tree().change_scene_to(leads)
