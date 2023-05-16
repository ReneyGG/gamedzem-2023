extends KinematicBody2D

var active = false
var motion = Vector2()
var gravity = 35
var light
#later add better acceleration

onready var animation = get_node("AnimationPlayer")

func _ready():
	animation.play("idle")
	get_node("Timer").start(0.1)

func activate():
	active = true

func _physics_process(_delta):
	if active:
		motion.y += gravity
		motion.x = 0
		motion = move_and_slide(motion,Vector2(0,-1))
	if is_on_floor():
		var collider = get_slide_collision(0).collider
		if collider is Enemy:
			collider.queue_free()

func _on_Area2D_body_entered(body):
	if active:
		if body.is_in_group("enemy"):
			body.kill()

func _on_Timer_timeout():
	randomize()
	light = rand_range(0.5,0.7)
	get_node("Light2D").energy = light
	get_node("Timer").start(rand_range(0.01,0.1))
