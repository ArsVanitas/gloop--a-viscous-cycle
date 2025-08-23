extends Node
class_name PlayerStats

enum PlayerStat { AttackRange, AttackSpeed, Defense, Health, MeleeDamage, MoveSpeed, RangedDamage, Size, CanDash }
enum Set { MOBILE, COLOSSUS }
var stat: PlayerStat
@export var UPGRADES : Array = []
@export var SETS : Array = []
#region: stats
static var max_hp : int = 100
static var health : int = 100
static var defense : int = 1
static var move_speed : int = 200
static var size : float = 1

static var ranged_damage : int = 5
static var attack_range : int = 300
static var attack_speed : float = 1.0
static var melee_damage : int = 10
#endregion
#region: bonus stats
static var bonus_max_hp : int
static var bonus_health : int
static var bonus_defense : int
static var bonus_move_speed : int
static var bonus_size : float

static var bonus_ranged_damage : int
static var bonus_attack_range : int
static var bonus_attack_speed : float
static var bonus_melee_damage : int
#endregion
@export var can_dash : bool = true
@export var MOBILE : bool = false

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
	UPGRADES.clear()
	SETS.clear()
	
	max_hp = 100
	health = 100
	defense = 1
	move_speed = 200
	size = 1

	ranged_damage = 5
	attack_range = 300
	attack_speed = 1
	melee_damage = 20
	
	bonus_max_hp = 0
	bonus_health = 0
	bonus_defense = 0
	bonus_move_speed = 0
	bonus_size = 0
	bonus_ranged_damage = 0
	bonus_attack_range = 0
	bonus_attack_speed = 0
	bonus_melee_damage = 0

func take_damage(amount : int):
	health -= amount

func update_stats(stat, amount):
	stat += amount

func check_set():
	if UPGRADES.count(PlayerStat.Health) == 3:
		size += 0.5
		for i in 3:
			UPGRADES.erase(PlayerStat.Health)
		SETS.append(Set.COLOSSUS)
	if UPGRADES.has(PlayerStat.MoveSpeed) and UPGRADES.count(PlayerStat.AttackSpeed) == 2:
		UPGRADES.erase(PlayerStat.MoveSpeed)
		for i in 2:
			UPGRADES.erase(PlayerStat.AttackSpeed)
		SETS.append(Set.MOBILE)
