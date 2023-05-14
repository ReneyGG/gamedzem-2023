extends KinematicBody2D

var gravity = 200
var speed = 40
var max_speed = 100
var motion = Vector2()
var player = null
var direction = -1


func _physics_process(delta):
	motion.y += gravity * delta
#	if player:
#		motion = position.direction_to((player.position * speed * delta))
	if motion.x >= (max_speed * -1) && direction == -1:
		motion.x += speed * direction * delta
	elif motion.x <= max_speed && direction == 1:
		motion.x += speed * direction * delta
	print(motion.x)
	motion = move_and_slide(motion)
	enemy()
	

func enemy():
	if $Sprite/RayLeft.is_colliding() && direction == -1:
		motion.x = 0.0
		direction = direction * -1
		get_node("Sprite").set_flip_h(true)
		print("change_dirrection Left")
	elif $Sprite/RayRight.is_colliding() && direction == 1:
		motion.x = 0.0
		direction = direction * -1
		get_node("Sprite").set_flip_h(false)
		print("change_dirrection Right")
