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
	enemy.range_of_sight(400,-400)
	enemy.hide()
	hl = false
	entered = false
	get_node("Door").open = false

func _on_DoorTrigger_body_entered(body):
	if body.name == "Player" and !entered:
		entered = true
		get_node("AnimationPlayer").play("Trigger")

func chest_check():
	if not get_node("Chest").open:
		enemy.after()
		enemy.noticed = true

func _on_Pause_body_entered(body):
	if body.has_method("stun") and enemy.noticed == false:
		body.stun()
		get_node("Search").play()
