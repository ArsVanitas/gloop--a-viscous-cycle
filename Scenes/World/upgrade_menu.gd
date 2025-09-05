extends CanvasLayer

@onready var cards = %Cards.get_children()
@onready var sfx_player: AudioStreamPlayer = %SFXPlayer

var upgrade_time = false
var card_picked = false

signal upgrade_picked

func _ready() -> void:
	for child in cards:
		child.selected.connect(hide_upgrade_menu)
	hide()


func show_upgrade_cards(amount):
	cards.shuffle()
	cards[0].show()
	cards[1].show()
	GlobalEnemyStats.UPGRADES.append(cards[0].stat)
	GlobalEnemyStats.UPGRADES.append(cards[1].stat)
	print("Enemy: ", GlobalEnemyStats.UPGRADES)

func show_upgrade_menu(amount):
	upgrade_time = true
	get_tree().paused = true
	show()
	show_upgrade_cards(amount)

func hide_upgrade_menu():
	hide()
	if upgrade_time:
		get_tree().paused = false
		upgrade_time = false
	%Cards.hide_buttons()
	upgrade_picked.emit()
	sfx_player.pitch_scale = randf_range(0.9, 1.1)
	sfx_player.play()
	print("Player: ", GlobalPlayerStats.UPGRADES)
	print("Enemy: ", GlobalEnemyStats.UPGRADES)
	GlobalEnemyStats.update()
	GlobalPlayerStats.check_set()

func _on_hp_pressed() -> void:
	#$NinePatchRect/MarginContainer/Cards/HP.add_upgrade()
	GlobalPlayerStats.UPGRADES.append(GlobalPlayerStats.PlayerStat.Health)
	GlobalEnemyStats.UPGRADES.erase(GlobalPlayerStats.PlayerStat.Health)
	GlobalPlayerStats.max_hp += 50
	GlobalPlayerStats.health += 50
	hide_upgrade_menu()

func _on_def_pressed() -> void:
	GlobalPlayerStats.UPGRADES.append(GlobalPlayerStats.PlayerStat.Defense)
	GlobalEnemyStats.UPGRADES.erase(GlobalPlayerStats.PlayerStat.Defense)
	GlobalPlayerStats.defense += 0.1
	hide_upgrade_menu()

func _on_range_pressed() -> void:
	GlobalPlayerStats.UPGRADES.append(GlobalPlayerStats.PlayerStat.AttackRange)
	GlobalEnemyStats.UPGRADES.erase(GlobalPlayerStats.PlayerStat.AttackRange)
	GlobalPlayerStats.attack_range += 50
	hide_upgrade_menu()

func _on_shot_dmg_pressed() -> void:
	GlobalPlayerStats.UPGRADES.append(GlobalPlayerStats.PlayerStat.RangedDamage)
	GlobalEnemyStats.UPGRADES.erase(GlobalPlayerStats.PlayerStat.RangedDamage)
	GlobalPlayerStats.ranged_damage += 5
	hide_upgrade_menu()

func _on_melee_pressed() -> void:
	GlobalPlayerStats.UPGRADES.append(GlobalPlayerStats.PlayerStat.MeleeDamage)
	GlobalEnemyStats.UPGRADES.erase(GlobalPlayerStats.PlayerStat.MeleeDamage)
	GlobalPlayerStats.melee_damage += 10
	hide_upgrade_menu()

func _on_atkspd_pressed() -> void:
	GlobalPlayerStats.UPGRADES.append(GlobalPlayerStats.PlayerStat.AttackSpeed)
	GlobalEnemyStats.UPGRADES.erase(GlobalPlayerStats.PlayerStat.AttackSpeed)
	GlobalPlayerStats.attack_speed += 0.5
	hide_upgrade_menu()

func _on_move_speed_pressed() -> void:
	GlobalPlayerStats.UPGRADES.append(GlobalPlayerStats.PlayerStat.MoveSpeed)
	GlobalEnemyStats.UPGRADES.erase(GlobalPlayerStats.PlayerStat.MoveSpeed)
	GlobalPlayerStats.move_speed += 50
	hide_upgrade_menu()

func _on_size_pressed() -> void:
	GlobalPlayerStats.UPGRADES.append(GlobalPlayerStats.PlayerStat.Size)
	GlobalEnemyStats.UPGRADES.erase(GlobalPlayerStats.PlayerStat.Size)
	GlobalPlayerStats.size += 0.5
	hide_upgrade_menu()
