extends Resource
class_name UpgradeCardResource

var StatDict : Dictionary = {
	HP = GlobalPlayerStats.max_hp,
	MS = GlobalPlayerStats.move_speed,
	AS = GlobalPlayerStats.attack_speed,
	RD = GlobalPlayerStats.ranged_damage,
	MD = GlobalPlayerStats.melee_damage,
	AR = GlobalPlayerStats.attack_range,
	SZ = GlobalPlayerStats.size,
	DASH = GlobalPlayerStats.can_dash
}

@export var title : String
@export var texture : Texture2D
@export var description : String
@export var icon : Texture2D
@export var stat : GlobalPlayerStats.PlayerStat
@export var amount : int

#func add_upgrade(stat, amount):
	#match stat:
		#stat.AttackRange: GlobalPlayerStats.bonus_attack_range += 50
		#stat.AttackSpeed: GlobalPlayerStats.attack_speed += 0.5
		#stat.Health: GlobalPlayerStats.bonus_max_hp += 50
		#stat.MeleeDamage: GlobalPlayerStats.bonus_melee_damage += 10
		#stat.MoveSpeed: GlobalPlayerStats.bonus_move_speed += 50
		#stat.RangedDamage: GlobalPlayerStats.bonus_ranged_damage += 5
		#stat.Size: GlobalPlayerStats.bonus_size += 0.2
		#stat.CanDash: GlobalPlayerStats.can_dash = true
