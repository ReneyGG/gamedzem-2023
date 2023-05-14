extends Area2D

func activate():
	print("hiding animation (wardrobe)")
	get_node("AnimationPlayer").play("activate")
