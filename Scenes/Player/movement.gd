extends State
class_name MoveState

func _process(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	player.velocity = direction * player.stats.move_speed
	player.move_and_slide()
