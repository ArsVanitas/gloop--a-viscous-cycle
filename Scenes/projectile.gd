extends Area2D

@export var speed : int = 500
@export var range : int

var direction : Vector2
var distance : int = 0

func _physics_process(delta: float) -> void:
	direction = Vector2.RIGHT.rotated(rotation)
	position += direction * speed * delta
	distance += speed * delta
	if distance >= range:
		queue_free()

func _on_body_entered(body: CharacterBody2D) -> void:
	if body.has_method("take_damage"):
		body.stats.take_damage(5)
	queue_free()

func _on_screen_exited() -> void:
	queue_free()
