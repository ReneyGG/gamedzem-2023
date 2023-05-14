extends KinematicBody2D

var active = false
var motion = Vector2()
var gravity = 35
#later add better acceleration

func activate():
	active = true

func _physics_process(_delta):
	if active:
		motion.y += gravity
		motion.x = 0
		motion = move_and_slide(motion,Vector2(0,-1))
	if is_on_floor():
		#change state
		pass

func _on_Area2D_body_entered(body):
	if active:
		if body.is_in_group("enemy"):
			body.kill()
