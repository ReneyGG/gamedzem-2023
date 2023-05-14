extends Area2D

func activate():
	get_parent().get_node("Chandelier").activate()
	self.monitorable = false
