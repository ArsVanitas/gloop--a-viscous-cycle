extends Control

@onready var player_dead : bool = false

func _ready() -> void:
	$AnimationPlayer.play("RESET")
	hide()

func _process(_delta: float) -> void:
	Menu()

func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("pause")
	hide()

func pause():
	get_tree().paused = true
	$AnimationPlayer.play("pause")
	show()

func Menu():
	if Input.is_action_just_pressed("menu") and !get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("menu") and get_tree().paused and !player_dead:
		resume()
 #
func player_death():
	pause()
	%Resume.hide()
	player_dead = true
	$Failed.show()

func _on_resume_pressed() -> void:
	resume()

func _on_restart_pressed() -> void:
	resume()
	get_tree().reload_current_scene()
	GlobalEnemyStats.evolution = 1

func _on_exit_pressed() -> void:
	get_tree().quit()
