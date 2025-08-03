extends State
class_name EnemyAttackState

const projectile_node = preload("uid://brp8wx0p1udkj")
@onready var pivot = %CrosshairMark
@onready var crosshair = %Crosshair
var can_shoot : bool = true

func Enter():
	animator.play("idle")
	await get_tree().create_timer(3).timeout
	state_transition.emit(self, %Movement)
	#%ShootingCD.start()
	#%ShootingCD.autostart = true

func Update(delta: float) -> void:
	pivot.look_at(player.position)
	await animator.animation_finished
	state_transition.emit(self, fsm.idle)
	
func shoot():
	animator.play("shoot")
	var projectile = projectile_node.instantiate()
	projectile.attack_range = enemy.stats.attack_range
	projectile.global_position = crosshair.global_position
	projectile.global_rotation = crosshair.global_rotation
	add_child(projectile)
	await animator.animation_finished

func melee():
	animator.play("melee")

func _on_shooting_cd_timeout() -> void:
	shoot()

#func Exit():
	#%ShootingCD.stop()
	#%ShootingCD.autostart = false
