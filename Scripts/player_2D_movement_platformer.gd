extends KinematicBody2D

var gravity = 35
var acceleration = 2000
var deacceleration = 2000
var max_speed = 300
var max_sprint_speed = 500
var friction = 2000
var jump_height = 600

onready var sprite = get_node("Sprite")
onready var timer = get_node("Timer")
#onready var state_machine = get_node("AnimationTree").get("parameters/playback")

var jump_count
var motion = Vector2()
var hSpeed = 0
var air = false

func _ready():
	timer.wait_time = 0.1
	timer.one_shot = true

func movement(var delta):
	if Input.is_action_pressed("ui_down"):
		sprite.scale = Vector2(1.1, 0.9)
		hSpeed -= min(abs(hSpeed), friction * delta) * sign(hSpeed)
	elif Input.is_action_pressed("ui_right"):
		if Input.is_action_pressed("Sprint"):
			if(hSpeed <-100):
				hSpeed += (deacceleration * delta)
			elif(hSpeed < max_sprint_speed):
				hSpeed += (acceleration * delta)
				sprite.flip_h = false
		else:
			if(hSpeed <-100):
				hSpeed += (deacceleration * delta)
			elif(hSpeed < max_speed):
				hSpeed += (acceleration * delta)
				sprite.flip_h = false
			else:
				hSpeed = 300
	elif Input.is_action_pressed("ui_left"):
		if Input.is_action_pressed("Sprint"):
			if(hSpeed > 100):
				hSpeed -= (deacceleration * delta)
			elif(hSpeed > -max_sprint_speed):
				hSpeed -= (acceleration * delta)
				sprite.flip_h = true
		else:
			if(hSpeed > 100):
				hSpeed -= (deacceleration * delta)
			elif(hSpeed > -max_speed):
				hSpeed -= (acceleration * delta)
				sprite.flip_h = true
			else:
				hSpeed = -300
	else:
		hSpeed -= min(abs(hSpeed), friction * delta) * sign(hSpeed)

func _physics_process(delta):
	motion.y += gravity
	
	movement(delta)
	if !is_on_floor():
		air = true
	if is_on_floor():
		if air:
			sprite.scale = Vector2(1.1, 0.9)
		air = false
		jump_count = 1
	if Input.is_action_just_pressed("ui_up"):
		sprite.scale = Vector2(0.9, 1.1)
		timer.start()

	if timer.get_time_left() > 0.0 and jump_count != 0:
		motion.y = -jump_height
		jump_count-=1
	
	motion.x = hSpeed
	motion = move_and_slide(motion,Vector2(0,-1))
	
	sprite.scale.x = lerp(sprite.scale.x, 1, 0.2)
	sprite.scale.y = lerp(sprite.scale.y, 1, 0.2)
	
func death():
	hide()
