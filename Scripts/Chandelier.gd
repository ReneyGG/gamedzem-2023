extends KinematicBody2D

var active = false
var motion = Vector2()
var gravity = 35
var light
var fell
#later add better acceleration

onready var animation = get_node("AnimationPlayer")
onready var camera = get_parent().get_node("Camera2D")

func _ready():
	fell = false
	animation.play("idle")
	get_node("Timer").start(0.1)

func activate():
	active = true

func _physics_process(_delta):
	if active:
		motion.y += gravity
		motion.x = 0
		motion = move_and_slide(motion,Vector2(0,-1))
	
	if fell:
		return
	
	if is_on_floor():
		fell = true
		animation.stop()
		$Sprite.frame = 2
		camera.add_trauma(0.3)
		get_node("Crash").play()
		var collider = get_slide_collision(0).collider
		if collider is Enemy:
			collider.queue_free()
		elif collider is Boss:
			collider.chandelier_hit = collider.chandelier_hit + 1
		elif collider is Player:
			collider.death()
			#queue_free()
		set_collision_layer_bit(3, true)
		set_collision_layer_bit(0, false)

#func _on_Area2D_body_entered(body):
#	if active:
#		if body.has_method("stun"):
#			body.stun()
#		elif body.has_method("death"):
#			body.death()

func _on_Timer_timeout():
	randomize()
	light = rand_range(0.5,0.7)
	get_node("Light2D").energy = light
	get_node("Timer").start(rand_range(0.01,0.1))
