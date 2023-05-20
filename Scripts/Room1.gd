extends Node2D

func _ready():
	get_node("Table/Label").hide()

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		get_node("Table/Label").show()

func _on_Area2D_body_exited(body):
	get_node("Table/Label").hide()
