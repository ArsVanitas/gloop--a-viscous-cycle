extends State
class_name MoveState

func Enter():
	animator.play("walk")

func Update(delta: float) -> void:
	player.velocity = player.direction * GlobalPlayerStats.move_speed
	player.move_and_slide()
	
	if player.velocity.length() == 0:
		state_transition.emit(self, fsm.idle)
	
	if Input.is_action_just_pressed("shoot") and fsm.can_shoot:
		state_transition.emit(self, fsm.shoot)
	
	if Input.is_action_just_pressed("melee") and fsm.can_melee:
		state_transition.emit(self, fsm.melee)
