extends KinematicBody2D


var gravity = 35
var acceleration = 2000
var deacceleration = 2000
var max_speed = 50
var friction = 2000

onready var sprite = get_node("Sprite")
onready var timer = get_node("Timer")


func _process(delta):
	position += Vector2.LEFT * max_speed * delta

	

