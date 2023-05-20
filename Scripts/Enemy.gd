class_name Enemy extends KinematicBody2D

export var gravity = 200
export var speed = 45
var direction = Vector2.LEFT
export var speed_bonus = 20
export var noticed = false

onready var animation = get_node("AnimationPlayer")
onready var motion = speed * direction
var tempMotion = motion

func _physics_process(delta):
	motion.y += gravity * delta
	motion = move_and_slide(motion, Vector2.UP)
	animation.play("Walking")
	enemy_rotate()
	chasing()
	attack()

func attack():
	if $Attack.monitoring:
		for body in $Attack.get_overlapping_bodies():
			if body.has_method("death"):
				animation.play("Atak")
				$Timer.start(0.7)
				$Attack/CollisionLeft.disabled = true
				$Attack/CollisionRight.disabled = true
				get_parent().get_node("Camera2D").add_trauma(0.2)
				body.death()

func enemy_rotate():
	var wall_left  = $AnimatedSprite/WallDetectors/RayLeft.is_colliding()
	var wall_right = $AnimatedSprite/WallDetectors/RayRight.is_colliding()
	if (wall_left && direction.x == -1) || (wall_right && direction.x == 1):
		direction.x *= -1
		motion.x = direction.x * speed
		if $AnimatedSprite.flip_h:
			get_node("AnimatedSprite").set_flip_h(false)
		else:
			get_node("AnimatedSprite").set_flip_h(true)

func chasing():
	if ($AnimatedSprite/LookingForPlayerLeft.is_colliding() && direction.x == -1) or noticed:
		motion.x = (speed + speed_bonus) * direction.x
		if !noticed:
			noticed = true
			after()
	elif ($AnimatedSprite/LookingForPlayerRight.is_colliding() && direction.x == 1) or noticed:
		motion.x = (speed + speed_bonus) * direction.x
		if !noticed:
			noticed = true
			after()
	else:
		motion.x = speed * direction.x

func stun():
	#$Attack.call_deferred("set",true)
	$Attack.monitoring = false
	animation.play("Calm")
	set_collision_layer_bit(2, false)
	set_collision_mask_bit(1, false)
	speed = 0
	speed_bonus = 0

func after():
	get_node("Attack").set_collision_mask_bit(5,true)


func _on_Timer_timeout():
	pass
