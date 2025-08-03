extends CharacterBody2D
class_name Enemy

@export var Sprites: Dictionary = {
	base = preload("uid://nqeayy85ng25"),
	evo2 = preload("uid://cw6to8qunjwt5"),
	evo3 = preload("uid://b8wvh4bbsgbc4"),
	evo4 = preload("uid://cxaigxnaig0fa"),
	SlimeViola = preload("uid://dm24d8hre7b7e"),
	Viola = preload("uid://iba2jyl4suka")
}
@export var stats = GlobalEnemyStats
@export var fsm : StateMachine
@onready var detect_radius = stats.attack_range:
	set(new_value):
		detect_radius = new_value
		%Radius.shape.radius = detect_radius
@onready var sprite = $EnemySprite
@onready var slash_vfx = $Slash
var health:
	set(new_value):
		health = new_value
		%HealthBar.max_value = stats.max_hp
		%HealthBar.value = health
		if health <= 0:
			health_depleted.emit()
			%DetectionRange.monitoring = false
			splat()

signal health_depleted

func _ready() -> void:
	health = stats.health
	%Radius.shape.radius = detect_radius

func _process(delta: float) -> void:
	if velocity.x < 0:
		$EnemySprite.flip_h = true
		#$Slash.flip_h = true
	elif velocity.x > 0:
		$EnemySprite.flip_h = false
		#$Slash.flip.h = false

func take_damage(amount):
	health -= amount

func splat():
	queue_free()
	const DEATH_SPLAT = preload("res://Scenes/death_splat.tscn")
	var splat = DEATH_SPLAT.instantiate()
	add_sibling(splat)
	splat.global_position = global_position
