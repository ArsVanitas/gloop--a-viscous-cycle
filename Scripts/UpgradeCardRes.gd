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

enum player_stat { Stat, MoveSpeed, AttackSpeed, RangedDamage, MeleeDamage, AttackRange, Size, CanDash }
@export var stat : player_stat
	#GlobalPlayerStats.max_hp,
	#GlobalPlayerStats.move_speed,
	#GlobalPlayerStats.attack_speed,
	#GlobalPlayerStats.ranged_damage,
	#GlobalPlayerStats.melee_damage,
	#GlobalPlayerStats.range,
	#GlobalPlayerStats.size,
	#GlobalPlayerStats.can_dash
#}
@export var amount : int
