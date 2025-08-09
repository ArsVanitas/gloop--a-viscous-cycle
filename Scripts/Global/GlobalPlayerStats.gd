extends Node
class_name PlayerStats

static var max_hp : int = 100
static var health : int = 100
static var defense : int = 1
static var move_speed : int = 200
static var size : float = 1

static var ranged_damage : int = 5
static var attack_range : int = 300
static var attack_speed : float = 1.0
static var melee_damage : int = 10

@export var can_dash : bool = false

var StatDict : Dictionary = {
	HP = max_hp,
	MS = move_speed,
	AS = attack_speed,
	RD = ranged_damage,
	MD = melee_damage,
	AR = attack_range,
	SZ = size,
	DASH = can_dash
}

func _ready() -> void:
	max_hp = 100
	health = 100
	defense = 1
	move_speed = 200
	size = 1

	ranged_damage = 100
	attack_range = 300
	attack_speed = 1
	melee_damage = 10

func take_damage(amount : int):
	health -= amount

#func update(stat, amount):
	#stat += amount
