extends StaticBody2D

@export var animator : AnimationPlayer
var can_touch : bool = false

signal upgrade_picked

func _ready() -> void:
	pass

func upgrade(amount):
	%UpgradeMenu.show_upgrade_menu(amount)

func canister_play(anim : String):
	%AnimationPlayer.play(anim)

func _on_canister_activated() -> void:
	if can_touch:
		upgrade(2)

func _on_test_00_stage_clear() -> void:
	show()
	canister_play("show")
	%InteractArea.monitoring = true

func _on_interact_area_body_entered(Player) -> void:
	can_touch = true

func _on_interact_area_body_exited(body: Node2D) -> void:
	can_touch = false
	
func _on_upgrade_menu_upgrade_picked() -> void:
	upgrade_picked.emit()
	canister_play("hide")
	%InteractArea.monitoring = false
	await %AnimationPlayer.animation_finished
	hide()
