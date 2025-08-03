extends Node2D
class_name State

@export var player : Player
@export var enemy : Enemy
@export var fsm : StateMachine
@export var animator : AnimationPlayer

signal state_transition

func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player")

func Enter(): pass

func Update(delta: float) -> void: pass

func Exit(): pass
