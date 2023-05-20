extends Node2D

onready var enemy = get_node("Enemy")

var hl
var entered
var st

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
	get_node("Door").open = false
	st = false

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		get_node("Table/Label").show()

func _on_Area2D_body_exited(body):
	get_node("Table/Label").hide()

func _on_DoorTrigger_body_entered(body):
	if body.name == "Player" and !entered:
		entered = true
		get_node("AnimationPlayer").play("Trigger")

func chest_check():
	if not get_node("Chest").open:
		get_node("Enemy").after()
		get_node("Enemy").noticed = true
	else:
		st = true

func _on_Pause_body_entered(body):
	if body.has_method("stun") and st:
		body.stun()
		print(st)
