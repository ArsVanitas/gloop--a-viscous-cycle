extends Control

#const level_scene: PackedScene = preload("res://Scenes/World/test00.tscn")

func _process(delta: float) -> void:
	%Logo.position

func _on_start_pressed() -> void:
	#var level = level_scene.instantiate()
	get_tree().change_scene_to_file("res://Scenes/World/test00.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
