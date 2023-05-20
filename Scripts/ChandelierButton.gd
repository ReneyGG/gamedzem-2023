extends Area2D


export(NodePath) var leads = "res://Scenes/Main.tscn"

func activate():
#	get_parent().get_node("Chandelier").activate()
	get_node(leads).activate()
	self.monitorable = false
