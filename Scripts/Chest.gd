extends Area2D

export var open = false

onready var sprite = get_node("AnimatedSprite")
export (bool) var skrzynia = true
var hl

func _ready():
	open = false
	hl = false

func activate():
	get_node("Sound").play()
	highlight()
	if sprite.frame == 0:
		if skrzynia == true:
			$AnimatedSprite.position = Vector2(5,-4)
			sprite.frame = 1
			open = true
		else:
			$AnimatedSprite.position = Vector2(5,-4)
			sprite.frame = 2
			open = true
	else:
		$AnimatedSprite.position = Vector2(0,0)
		sprite.frame = 0
		open = false

func highlight():
	hl = !hl
	if hl:
#		if $AnimatedSprite.frame == 1:
#			$AnimatedSprite.frame = 4
#		elif $AnimatedSprite.frame == 2:
#			$AnimatedSprite.frame = 5
#		elif $AnimatedSprite.frame == 0:
#			$AniamtedSprite.frame = 3
		$AnimatedSprite.frame += 3
	else:
		$AnimatedSprite.frame -= 3
