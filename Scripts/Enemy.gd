class_name Enemy extends KinematicBody2D

export var gravity = 200
export var speed = 35
var direction = Vector2.LEFT
export var speed_bonus = 20
export var noticed = false

onready var motion = speed * direction
var tempMotion = motion

func _physics_process(delta):
	motion.y += gravity * delta
	motion = move_and_slide(motion, Vector2.UP)
	enemy_rotate()
	chasing()
	attack()

func attack():
	for body in $Attack.get_overlapping_bodies():
		if body.has_method("death"):
			$Attack/CollisionLeft.disabled = true
			$Attack/CollisionRight.disabled = true
			print("ATTACK")
			body.death()

func enemy_rotate():
	var wall_left  = $Sprite/WallDetectors/RayLeft.is_colliding()
	var wall_right = $Sprite/WallDetectors/RayRight.is_colliding()
	if (wall_left && direction.x == -1) || (wall_right && direction.x == 1):
		direction.x *= -1
		motion.x = direction.x * speed
		if $Sprite.flip_h:
			get_node("Sprite").set_flip_h(false)
		else:
			get_node("Sprite").set_flip_h(true)

func chasing():
	if ($Sprite/LookingForPlayerLeft.is_colliding() && direction.x == -1) or noticed:
		motion.x = (speed + speed_bonus) * direction.x
		if !noticed:
			noticed = true
			after()
	elif ($Sprite/LookingForPlayerRight.is_colliding() && direction.x == 1) or noticed:
		motion.x = (speed + speed_bonus) * direction.x
		if !noticed:
			noticed = true
			after()
	else:
		motion.x = speed * direction.x

func after():
	get_node("Attack").set_collision_mask_bit(5,true)
