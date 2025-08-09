extends StateMachine
class_name EnemyBehavior

@export var States: Dictionary = {
	
}

@export var init_state : State
@export var animator : AnimationPlayer
@export var sprite : Sprite2D
@export var body : Enemy
var player : Player
@onready var pivot = %CrosshairMark

func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player")
	for child in get_children():
		if child is State:
			child.state_transition.connect(change_state)
	init_state.Enter()
	current_state = init_state
	
func _process(delta: float) -> void:
	pivot.look_at(player.position)
	current_state.Update(delta)
	#print(current_state)
	#print($"..".velocity)
	if body.velocity.length() > 0:
		animator.play("walk")
	else:
		animator.play("idle")

func change_state(old_state : State, new_state : State):
	old_state.Exit()
	new_state.Enter()
	current_state = new_state

func _on_detection_range_body_entered(body: Player) -> void:
	if body.is_in_group("Player"):
		%ShootingCD.start()
		%ShootingCD.autostart = true
		change_state(current_state, %Attack)

func _on_detection_range_body_exited(body: Player) -> void:
	if body.is_in_group("Player"):
		%ShootingCD.stop()
		%ShootingCD.autostart = false
		change_state(current_state, %Idle)

func _on_enemy_health_depleted() -> void:
	death.Enter()
