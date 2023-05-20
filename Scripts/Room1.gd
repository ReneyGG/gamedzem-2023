extends Node2D

onready var enemy = get_node("Enemy")

var hl
var entered

func _ready():
	#later add stun for enemy and use here
	enemy.speed = 0
	enemy.speed_bonus = 0
	enemy.gravity = 0
	enemy.position = Vector2(380,80)
	enemy.hide()
	hl = false
	entered = false
	get_node("Table/Label").hide()

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		get_node("Table/Label").show()

func _on_Area2D_body_exited(body):
	get_node("Table/Label").hide()

func _on_DoorTrigger_body_entered(body):
	if body.name == "Player" and !entered:
		entered = true
		get_node("AnimationPlayer").play("Trigger")
