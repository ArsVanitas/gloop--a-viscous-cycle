extends Resource
class_name Stats

@export var max_hp : int
@export var health : int
@export var defense : int
@export var move_speed : int

@export var ranged_damage : int
@export var range : int
@export var melee_damage : int

@export var can_dash : bool = false


func take_damage(amount : int):
	health -= amount
