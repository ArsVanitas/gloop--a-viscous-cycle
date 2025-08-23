extends CharacterBody2D
class_name Player

@onready var stats = GlobalPlayerStats
@onready var fsm : StateMachine = $StateMachine
@onready var healthbar = %HealthBar
@onready var pivot = %CrosshairMark
@onready var crosshair = %Crosshair

@onready var health = stats.health:
	set(new_value):
		health = new_value
		health = clamp(health, 0, GlobalPlayerStats.max_hp)
		healthbar.max_value = GlobalPlayerStats.max_hp
		healthbar.value = health
		if health <= 0:
			death_splat()
			health_depleted.emit()
@onready var defense = stats.defense
@onready var move_speed = stats.move_speed:
	set(new_value):
		move_speed = new_value
@onready var size = GlobalPlayerStats.size:
	set(new):
		size = new
		scale.x = size
		scale.y = size
@onready var ranged_damage = stats.ranged_damage
@onready var attack_range = stats.attack_range
@onready var attack_speed = stats.attack_speed:
	set(new_value):
		attack_speed = new_value
		%ShootTimer.wait_time = (0.5 / attack_speed)
@onready var melee_damage = stats.melee_damage

signal health_depleted

var direction

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	defense = GlobalPlayerStats.defense
	#move_speed = GlobalPlayerStats.move_speed
	size = GlobalPlayerStats.size

	ranged_damage = GlobalPlayerStats.ranged_damage
	attack_range = GlobalPlayerStats.attack_range
	attack_speed = GlobalPlayerStats.attack_speed
	melee_damage = GlobalPlayerStats.melee_damage
	
	direction = Input.get_vector("left", "right", "up", "down")
	
	#sprite flipping
	if velocity.x < 0:
		%PlayerSprite.flip_h = true
		%Shadow.position.x = 5
	if velocity.x > 0:
		%PlayerSprite.flip_h = false
		%Shadow.position.x = -5
	if velocity.x == 0 and (crosshair.global_position.x - global_position.x) < 0:
		%PlayerSprite.flip_h = true
		%Shadow.position.x = 5
	if velocity.x == 0 and (crosshair.global_position.x - global_position.x) > 0:
		%PlayerSprite.flip_h = false
		%Shadow.position.x = -5

func take_damage(amount):
	health -= amount / defense

func death_splat():
	const DEATH_SPLAT = preload("res://Scenes/death_splat.tscn")
	var splat = DEATH_SPLAT.instantiate()
	add_sibling(splat)
	splat.global_position = global_position
	%PlayerSprite.visible = false
