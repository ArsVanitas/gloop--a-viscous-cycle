extends State
class_name EnemyIdle

var direction : Vector2
var distance
var range

func Enter():
	animator.play("idle")
	direction = player.global_position - enemy.global_position
	range = enemy.stats.range

func Update(delta):
	distance = direction.length()
	if distance >= range:
		#await get_tree().create_timer(2).timeout
		state_transition.emit(self, %Movement)
	if distance <= range:
		#await get_tree().create_timer(2).timeout
		state_transition.emit(self, %Attack)
