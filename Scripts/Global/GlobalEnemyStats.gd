extends Node
class_name EnemyStats

var stat: GlobalPlayerStats.PlayerStat
@export var UPGRADES : Array = []

static var max_hp : int = 100
static var health : int = 100
static var defense : int = 10
static var move_speed : int = 100

static var ranged_damage : int = 5
static var attack_range : int = 300
static var attack_speed : int = 1
static var melee_damage : int = 10

static var can_dash : bool = false

var evolution : int

signal enemy_evolve

func _ready() -> void:
	max_hp = 100
	health = 100
	defense = 10
	move_speed = 100

	ranged_damage = 5
	attack_range = 300
	attack_speed = 1
	melee_damage = 10
	
	evolution = 1

func take_damage(amount : int):
	health -= amount

#func update(stat, amount):
	#stat += amount
