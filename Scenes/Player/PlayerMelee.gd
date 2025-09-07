extends State
class_name PlayerMelee

func Enter():
	animator.play("melee")
	fsm.can_melee = false
	await animator.animation_finished
	fsm.can_melee = true
	state_transition.emit(self, fsm.idle)
#
func Update(delta):
	if (player.crosshair.global_position.x - player.global_position.x) < 0:
		%PlayerSprite.flip_h = true
		%Shadow.position.x = 5
		%MeleeHitbox.scale.x = -1
	if (player.crosshair.global_position.x - player.global_position.x) > 0:
		%PlayerSprite.flip_h = false
		%Shadow.position.x = -5
		%MeleeHitbox.scale.x = 1

func _on_melee_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemy"):
		player.sfx_player.play()
		GameManager.freeze_frame(0.0, 0.2)
		body.take_damage(GlobalPlayerStats.melee_damage)
		body.global_position = lerp(body.global_position, (body.global_position - player.global_position), 0.5)
