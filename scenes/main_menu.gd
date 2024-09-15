extends Node

@onready var dog_bark: AudioStreamPlayer2D = $dog_bark

func _on_new_game_pressed() -> void:
	dog_bark.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://main.tscn")
	
