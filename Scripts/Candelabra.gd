extends AnimatedSprite

var light

func _ready():
	get_node("AnimationPlayer").play("loop")
	get_node("Timer").start(0.1)

func _on_Timer_timeout():
	randomize()
	light = rand_range(0.5,0.7)
	get_node("Light2D").energy = light
	get_node("Timer").start(rand_range(0.01,0.1))
