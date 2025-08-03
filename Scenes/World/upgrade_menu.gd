extends CanvasLayer

var upgrade_time = false
var card_picked = false

signal upgrade_picked

func _ready() -> void:
	hide()

func show_upgrade_cards(amount):
	for i in amount:
		#const UPGRADE_CARD = preload("res://Scenes/UI/upgrade_card.tscn")
		#var upgrade = UPGRADE_CARD.instantiate()
		#upgrade.card_res = GlobalUpgradeCards.Cards.pick_random()
		%Cards.get_children().pick_random().show()
		#%Cards.add_child(upgrade)
		

func show_upgrade_menu(amount):
	upgrade_time = true
	get_tree().paused = true
	show_upgrade_cards(amount)
	show()

func hide_upgrade_menu():
	hide()
	if upgrade_time:
		get_tree().paused = false
		upgrade_time = false
	%Cards.hide_buttons()
	upgrade_picked.emit()
	

func _on_hp_pressed() -> void:
	GlobalPlayerStats.max_hp += 50
	GlobalPlayerStats.health += 50
	hide_upgrade_menu()

func _on_def_pressed() -> void:
	GlobalPlayerStats.defense += 0.1
	hide_upgrade_menu()

func _on_range_pressed() -> void:
	GlobalPlayerStats.attack_range += 50
	hide_upgrade_menu()

func _on_shot_dmg_pressed() -> void:
	GlobalPlayerStats.ranged_damage += 5
	hide_upgrade_menu()

func _on_melee_pressed() -> void:
	GlobalPlayerStats.melee_damage += 10
	hide_upgrade_menu()

func _on_atkspd_pressed() -> void:
	GlobalPlayerStats.attack_speed += 0.5
	hide_upgrade_menu()

func _on_move_speed_pressed() -> void:
	GlobalPlayerStats.move_speed += 50
	hide_upgrade_menu()

func _on_size_pressed() -> void:
	GlobalPlayerStats.size += 0.5
	hide_upgrade_menu()
