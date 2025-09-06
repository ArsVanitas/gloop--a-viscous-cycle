extends Node
class_name EnemyStats

var stat = GlobalPlayerStats.PlayerStat
@export var UPGRADES : Array = []

static var max_hp : int = 100
static var health : int = 100
static var defense : int = 10
static var move_speed : int = 100
static var size : float = 1

static var ranged_damage : int = 5
static var attack_range : int = 300
static var attack_speed : float = 1.0
static var melee_damage : int = 10

static var can_dash : bool = false

var evolution : int

signal enemy_evolve

func _ready() -> void:
	UPGRADES.clear()
	max_hp = 100
	health = 100
	defense = 1
	move_speed = 200
	size = 1

	ranged_damage = 5
	attack_range = 300
	attack_speed = 1
	melee_damage = 20
	
	evolution = 1

func take_damage(amount : int):
	health -= amount

func update():
	for stat in UPGRADES:
		match stat:
			GlobalPlayerStats.PlayerStat.Health: max_hp = 100 + (50 * UPGRADES.count(GlobalPlayerStats.PlayerStat.Health))
			GlobalPlayerStats.PlayerStat.RangedDamage: ranged_damage = 5 + (5 * UPGRADES.count(GlobalPlayerStats.PlayerStat.RangedDamage))
			GlobalPlayerStats.PlayerStat.Defense: defense = 1 + (0.5 * UPGRADES.count(GlobalPlayerStats.PlayerStat.Defense))
			GlobalPlayerStats.PlayerStat.MoveSpeed: move_speed = 100 + (50 * UPGRADES.count(GlobalPlayerStats.PlayerStat.MoveSpeed))
			GlobalPlayerStats.PlayerStat.AttackRange: attack_range = 300 + (50 * UPGRADES.count(GlobalPlayerStats.PlayerStat.AttackRange))
			GlobalPlayerStats.PlayerStat.AttackSpeed: attack_speed = 1.0 + (0.5 * UPGRADES.count(GlobalPlayerStats.PlayerStat.AttackSpeed))
			GlobalPlayerStats.PlayerStat.MeleeDamage: melee_damage = 10 + (5 * UPGRADES.count(GlobalPlayerStats.PlayerStat.MeleeDamage))
			GlobalPlayerStats.PlayerStat.Size: size = 1.0 + (0.5 * UPGRADES.count(GlobalPlayerStats.PlayerStat.Size))
	print(max_hp, "/", ranged_damage)
