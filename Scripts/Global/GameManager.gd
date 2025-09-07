extends Node
class_name Globals

var upgrade_time : bool = false
var player_dead = false

signal stage_clear
signal canister_activated

func freeze_frame(timescale: float, duration: float) -> void:
	Engine.time_scale = timescale
	await get_tree().create_timer(duration, true, false, true).timeout
	Engine.time_scale = 1
