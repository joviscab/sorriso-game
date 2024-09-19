extends Node

@onready var dog_bark: AudioStreamPlayer2D = $dog_bark


func _on_main_menu_pressed() -> void:
	dog_bark.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_next_level_pressed() -> void:
	dog_bark.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://scenes/level_2.tscn")
