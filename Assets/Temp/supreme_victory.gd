extends Control

var level_scene: PackedScene = load("uid://cuybst0hgur68")


func _input(event):
	if event.is_action_pressed("shoot"):
		get_tree().change_scene_to_packed(level_scene)
