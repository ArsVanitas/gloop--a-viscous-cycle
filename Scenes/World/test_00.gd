extends Node2D
class_name Arena

const ENTER_LVL = preload("res://Assets/Audio/Sounds/332919__cooltron__winlevel.wav")
const LVL00_MUSIC = preload("res://Assets/Audio/AbsoluteGloopanza.ogg")
const ENEMY = preload("res://Scenes/Enemy/enemy.tscn")
@onready var audio: AudioStreamPlayer = %MusicPlayer
@onready var animator: AnimationPlayer = %AnimationPlayer

@onready var canister = %Canister
var statement : String
@onready var enemy_number = %Enemies.get_child_count()

signal stage_clear
signal canister_activated

func _ready() -> void:
	GlobalPlayerStats._ready()
	initialize_level()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		if canister.can_touch:
			canister_activated.emit()

func initialize_level():
	animator.play("start")
	if %AnimationPlayer.is_playing():
		await %AnimationPlayer.animation_finished
	canister.canister_play("show")
	await canister.animator.animation_finished
	spawn_enemy()
	audio.playing = true

func _on_enemies_child_exiting_tree(node: Node) -> void:
	stage_clear.emit()

func _on_canister_upgrade_picked() -> void:
	GlobalEnemyStats.evolution += 1
	$Player.health += int(GlobalPlayerStats.max_hp / 2)
	spawn_enemy()
	print(GlobalPlayerStats.UPGRADES)

func _on_player_health_depleted() -> void:
	%PauseMenu.player_death()
	GlobalEnemyStats.evolution = 1

func spawn_enemy():
	canister.canister_play("open")
	await canister.animator.animation_finished
	var enemy = ENEMY.instantiate()
	enemy.global_position = canister.spawner.global_position
	%Enemies.add_child(enemy)
	canister.canister_play("close")
	await canister.animator.animation_finished
	canister.canister_play("hide")
