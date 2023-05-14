extends Area2D


const FIRE_DAMAGE = 10

func _physics_process(delta):
	for body in get_overlapping_bodies():
		if body.has_method("take_damage"):
			body.take_damage(FIRE_DAMAGE * delta)
