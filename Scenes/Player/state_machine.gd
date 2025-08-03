extends Node2D
class_name StateMachine

@export var initial_state : State

@export_group("States")
@export var idle : State
@export var shoot : State
@export var melee : State
@export var movement : State
@export var dash : State
@export var death : State

var current_state : State

@export_group("Bools")
@export var can_move : bool = true
@export var can_dash : bool = false
@export var can_shoot : bool = true
@export var can_melee : bool = true
@export var can_take_damage : bool = true

func _ready() -> void:
	for child in get_children():
		if child is State:
			child.state_transition.connect(change_state)
	current_state = initial_state
	current_state.Enter()

func _process(delta: float) -> void:
	current_state.Update(delta)

func change_state(old_state : State, new_state : State):
	print(old_state, current_state, new_state)
	old_state.Exit()
	new_state.Enter()
	current_state = new_state
	
