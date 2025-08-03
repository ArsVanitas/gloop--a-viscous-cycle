extends State
class_name EnemyIdle

var direction : Vector2
var distance
var attack_range

func Enter():
	animator.play("idle")
	direction = player.global_position - enemy.global_position
	attack_range = enemy.stats.attack_range

func Update(delta):
	distance = direction.length()
	if distance >= attack_range:
		#await get_tree().create_timer(2).timeout
		state_transition.emit(self, %Movement)
	if distance <= attack_range:
		#await get_tree().create_timer(2).timeout
		state_transition.emit(self, %Attack)
