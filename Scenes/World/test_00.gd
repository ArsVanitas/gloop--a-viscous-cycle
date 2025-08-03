extends Node2D
class_name Arena

const ENEMY = preload("res://Scenes/Enemy/enemy.tscn")
@onready var canister = %Canister
var statement : String
@onready var enemy_number = %Enemies.get_child_count()

signal stage_clear
signal canister_activated

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		if canister.can_touch:
			canister_activated.emit()

func _on_enemy_health_depleted():
	stage_clear.emit()

func _on_enemies_child_exiting_tree(node: Node) -> void:
	stage_clear.emit()

func _on_canister_upgrade_picked() -> void:
	var enemy = ENEMY.instantiate()
	enemy.global_position = canister.global_position
	%Enemies.add_child(enemy)
	$Player.health += GlobalPlayerStats.max_hp / 2

func _on_player_health_depleted() -> void:
	%PauseMenu.player_death()
