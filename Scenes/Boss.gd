class_name Boss extends KinematicBody2D


var gravity = 200
export var speed = 55
export var speed_bonus = 35
var speed_temp = speed
var speed_bonus_temp = speed_bonus
var direction = Vector2.LEFT
var chandelier_hit = 0
var temp = chandelier_hit
onready var animation = get_node("AnimationPlayer")

onready var motion = speed * direction
var tempMotion = motion

func _physics_process(delta):
	motion.y += gravity * delta
	motion = move_and_slide(motion, Vector2.UP)
	animation.play("Walk")
	enemy_rotate()
	chasing()
	attack()
	if chandelier_hit == 2:
		ending()
	elif chandelier_hit > temp:
		temp = temp + 1
		stun()
	
func ending():
	queue_free()
	
func stun():
	$Attack/CollisionLeft.disabled = true
	$Attack/CollisionRight.disabled = true
	animation.play("Stun")
	$Sprite.rotation_degrees = 90
	set_collision_layer_bit(2, false)
	set_collision_mask_bit(1, false)
	speed = 0
	speed_bonus = 0
	$Timer.start(3)

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
	if $Sprite/LookingForPlayerLeft.is_colliding() && direction.x == -1:
		motion.x = (speed + speed_bonus) * direction.x
	elif $Sprite/LookingForPlayerRight.is_colliding() && direction.x == 1:
		motion.x = (speed + speed_bonus) * direction.x
	else:
		motion.x = speed * direction.x

func _on_Timer_timeout():
	$Attack/CollisionLeft.disabled = false
	$Attack/CollisionRight.disabled = false
	$Sprite.rotation_degrees = 0
	set_collision_layer_bit(2, true)
	set_collision_mask_bit(1, true)
	speed = speed_temp
	speed_bonus = speed_bonus_temp
	direction.x *= -1
	motion.x = speed * direction.x
	if $Sprite.flip_h:
		get_node("Sprite").set_flip_h(false)
	else:
		get_node("Sprite").set_flip_h(true)
	speed = speed + 30
