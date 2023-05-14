extends Control

onready var animation = get_node("AnimationPlayer")

func _ready():
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
