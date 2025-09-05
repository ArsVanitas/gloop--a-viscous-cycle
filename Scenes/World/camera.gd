extends Camera2D

@export var player: Player
@export var enemy: Enemy
var player_pos: Vector2
var enemy_pos: Vector2

func _process(delta: float) -> void:
	if !enemy:
		reset_camera()
	else:
		var distance: Vector2
		var zoom_mod
		player_pos = player.global_position
		enemy_pos = enemy.global_position
		distance = enemy_pos - player_pos
		offset = lerp(offset, (distance / 2), 0.1)
		zoom_mod = 1 + (10 / distance.length())
		#if distance.length() > 500:
			#zoom_mod = 1 - (10 / distance.length())
		zoom = Vector2.ONE * zoom_mod

func get_enemy_pos():
	enemy = get_tree().get_first_node_in_group("Enemy")
	enemy_pos = enemy.global_position

func reset_camera():
	offset = lerp(offset, Vector2.ZERO, 0.1)
	zoom = lerp(zoom, Vector2(1, 1), 0.5)
