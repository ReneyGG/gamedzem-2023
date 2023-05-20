extends Node2D

var blink = false

onready var player = get_parent().get_node("Player")
onready var animation = get_node("AnimatedSprite")

func _ready():
	blink()


func _process(_delta):
	if blink:
		return
	
	if player.global_position.x - self.global_position.x < -15:
		animation.frame = 2
	elif player.global_position.x - self.global_position.x> 15:
		animation.frame = 0
	else:
		animation.frame = 1

func blink():
	randomize()
	var s = rand_range(3.5, 6)
	get_node("Timer").start(s)

func _on_Timer_timeout():
	blink = true
	animation.frame = 3
	get_node("BlinkTimer").start()
	blink()

func _on_BlinkTimer_timeout():
	blink = false
