extends State
class_name DeathState

func die():
	enemy.queue_free()
