extends AnimatedSprite

var light
var over

func _ready():
	over = false
	light = 0.5
	get_node("AnimationPlayer").play("loop")
	get_node("Timer").start(0.1)

#func _physics_process(_delta):
#	randomize()
#	light = rand_range(0.5,0.8)
#	get_node("Light2D").energy = light
#
#	if over:
#		light -= 0.015
#	else:
#		light += 0.015
#
#	if light <= 0.5:
#		over = false
#	elif light >= 0.8:
#		over = true
#
#	get_node("Light2D").energy = light

func _on_Timer_timeout():
	randomize()
	light = rand_range(0.5,0.7)
	get_node("Light2D").energy = light
	get_node("Timer").start(rand_range(0.01,0.1))
