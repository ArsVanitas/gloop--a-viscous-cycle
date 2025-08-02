extends CharacterBody2D
class_name Player

@export var stats : Stats
@export var FiniteStateMachine : State
@onready var healthbar : ProgressBar = %HealthBar
@onready var hp = stats.health:
	set(new_value):
		hp = new_value
		healthbar.max_value = stats.max_hp
		healthbar.value = hp

func _ready() -> void:
	healthbar.max_value = stats.max_hp
	healthbar.value = hp

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click"):
		update(stats.move_speed, 100)
		stats.take_damage(5)
		print(stats.health)

func update(stat, amount : int):
	stat += amount
	print(stat)
