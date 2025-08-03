extends State
class_name DeathState

func Enter():
	animator.play("death")
	await animator.animation_finished
	die()

func die():
	enemy.queue_free()
