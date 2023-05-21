extends Control

onready var animation = get_node("AnimationPlayer")

var next

func _ready():
	get_node("Music").play()
	get_node("AnimatedSprite").frame = 0
	get_node("AnimatedSprite").position = Vector2(222,128)

func _on_Book_pressed():
	animation.play("open")
	get_node("Book").queue_free()

func _on_StartButton_mouse_entered():
	get_node("Okladka2-1/Start").self_modulate = Color("bd5050")

func _on_CreditsButton_mouse_entered():
	get_node("Okladka2-1/Credits").self_modulate = Color("bd5050")

func _on_KoniecButton_mouse_entered():
	get_node("Okladka2-1/Koniec").self_modulate = Color("bd5050")

func _on_StartButton_mouse_exited():
	get_node("Okladka2-1/Start").self_modulate = Color("500000")

func _on_CreditsButton_mouse_exited():
	get_node("Okladka2-1/Credits").self_modulate = Color("500000")

func _on_KoniecButton_mouse_exited():
	get_node("Okladka2-1/Koniec").self_modulate = Color("500000")

func _on_StartButton_pressed():
	next = "res://Scenes/Rooms/Room1.tscn"
	butt_stuff()

func _on_CreditsButton_pressed():
	next = "res://Scenes/Autorzy.tscn"
	butt_stuff()

func _on_KoniecButton_pressed():
	get_tree().quit()

func game():
	get_tree().change_scene("res://Scenes/Rooms/Room1.tscn")

func butt_stuff():
	get_node("Button").play()
	get_node("Okladka2-1/Start/StartButton").disabled = true
	get_node("Okladka2-1/Credits/CreditsButton").disabled = true
	get_node("Okladka2-1/Koniec/KoniecButton").disabled = true
	animation.play("fade_out")
