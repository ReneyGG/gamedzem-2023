extends Area2D

export var content = "Lorem ipsum dolor sit amet"

func activate():
	get_parent().get_node("Player").note(content)
	#queue_free()
