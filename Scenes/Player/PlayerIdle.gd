extends State
class_name PlayerIdle

func Enter():
	if GlobalPlayerStats.health > (GlobalPlayerStats.max_hp / 2):
		animator.play("idle")
	elif GlobalPlayerStats.health < (GlobalPlayerStats.max_hp / 2):
		animator.play("idle_tired")

func Update(delta):
	if (%Crosshair.global_position.x - player.global_position.x) < 0:
		%PlayerSprite.flip_h = true
		%Shadow.position.x = 5
	if (%Crosshair.global_position.x - player.global_position.x) > 0:
		%PlayerSprite.flip_h = false
		%Shadow.position.x = -5
	
	if player.direction.length() > 0:
		state_transition.emit(self, fsm.movement)
	
	if Input.is_action_just_pressed("shoot") and fsm.can_shoot:
		state_transition.emit(self, fsm.shoot)
	
	if Input.is_action_just_pressed("melee") and fsm.can_melee:
		state_transition.emit(self, fsm.melee)
