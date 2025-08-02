extends State
class_name EnemyMovement

var direction : Vector2
var distance
var range
var speed

func Enter():
	range = enemy.stats.range
	animator.play("walk")
	
func Update(delta):
	speed = enemy.stats.move_speed
	direction = player.position - enemy.position
	distance = direction.length()
	#direction += Vector2(randf_range(-1, 1), randf_range(-1, 1))
	
	if distance >= range:
		await get_tree().create_timer(2).timeout
		approach_player()
	
	if distance <= range:
		disengage()
		await get_tree().create_timer(2).timeout
	
	enemy.velocity = direction * speed * delta
	enemy.move_and_slide()
	print(direction)

func approach_player():
	animator.play("walk")
	direction = player.position - enemy.position
	if distance <= range:
		state_transition.emit(self, %Attack)

func disengage():
	animator.play("walk")
	direction = enemy.position - player.position
	await get_tree().create_timer(2).timeout
	state_transition.emit(self, %Idle)

func Exit():
	enemy.velocity.lerp(Vector2.ZERO, 1)
	#animator.play("idle")
