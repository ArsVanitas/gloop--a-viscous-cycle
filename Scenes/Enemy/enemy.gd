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
@onready var slash_vfx = $Slash
var health:
	set(new_value):
		health = new_value
		%HealthBar.max_value = stats.max_hp
		%HealthBar.value = health
		if health <= 0:
			health_depleted.emit()
			%DetectionRange.monitoring = false
			death_splat()
var evo

signal health_depleted

func _ready() -> void:
	health = stats.health
	evo = GlobalEnemyStats.evolution
	%Radius.shape.radius = detect_radius
	match evo:
		1, 2: %EnemySprite.texture = Sprites["base"]
		3, 4: %EnemySprite.texture = Sprites["evo2"]
		5, 6: %EnemySprite.texture = Sprites["evo3"]
		7, 8: %EnemySprite.texture = Sprites["evo4"]
	if evo >= 9: %EnemySprite.texture = Sprites["SlimeViola"]


func _process(delta: float) -> void:
	if velocity.x < 0 or (%CrosshairMark.global_position.x - global_position.x) < 0:
		$EnemySprite.flip_h = true
		#$Slash.flip_h = true
	if velocity.x > 0 or (%CrosshairMark.global_position.x - global_position.x) > 0:
		$EnemySprite.flip_h = false
		#$Slash.flip.h = false

func take_damage(amount):
	health -= amount

func death_splat():
	queue_free()
	const DEATH_SPLAT = preload("res://Scenes/death_splat.tscn")
	var splat = DEATH_SPLAT.instantiate()
	add_sibling(splat)
	splat.global_position = global_position
