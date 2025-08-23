extends Control
class_name UpgradeCard

@onready var upgrade_pool
@export var card_res : UpgradeCardResource
var stat

signal selected

func _ready() -> void:
	%CardName.text = card_res.title
	%Texture.texture = card_res.texture
	%Description.text = card_res.description
	stat = card_res.stat

func add_upgrade():
	#match card_res.stat:
		#card_res.PlayerStat.AttackRange: GlobalPlayerStats.bonus_attack_range += 50
		#card_res.PlayerStat.AttackSpeed: GlobalPlayerStats.attack_speed += 0.5
		#card_res.PlayerStat.Health: GlobalPlayerStats.bonus_max_hp += 50
		#card_res.PlayerStat.MeleeDamage: GlobalPlayerStats.bonus_melee_damage += 10
		#card_res.PlayerStat.MoveSpeed: GlobalPlayerStats.bonus_move_speed += 50
		#card_res.PlayerStat.RangedDamage: GlobalPlayerStats.bonus_ranged_damage += 5
		#card_res.PlayerStat.Size: GlobalPlayerStats.bonus_size += 0.2
		#card_res.PlayerStat.CanDash: GlobalPlayerStats.can_dash = true
	selected.emit()
