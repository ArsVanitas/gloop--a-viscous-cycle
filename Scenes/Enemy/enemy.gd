extends CharacterBody2D
class_name Enemy

@export var Sprites: Dictionary = {
	base = preload("uid://nqeayy85ng25"),
	evo1 = preload("uid://cw6to8qunjwt5"),
	evo2 = preload("uid://b8wvh4bbsgbc4"),
	evo3 = preload("uid://cxaigxnaig0fa"),
}



@export var stats : Stats
@onready var detect_radius = stats.range:
	set(new_value):
		detect_radius = new_value
		%Radius.shape.radius = detect_radius
@onready var sprite = $EnemySprite
@onready var slash_vfx = $Slash

func _ready() -> void:
	%Radius.shape.radius = detect_radius

func _process(delta: float) -> void:
	if velocity.x < 0:
		$EnemySprite.flip_h = true
		#$Slash.flip_h = true
	elif velocity.x > 0:
		$EnemySprite.flip_h = false
		#$Slash.flip.h = false


func _on_button_pressed() -> void:
	sprite.texture = Sprites.base

func _on_button_2_pressed() -> void:
	sprite.texture = Sprites.evo1

func _on_button_3_pressed() -> void:
	sprite.texture = Sprites.evo2

func _on_button_4_pressed() -> void:
	sprite.texture = Sprites.evo3

func _on_button_5_pressed() -> void:
	sprite.scale += Vector2(0.2, 0.2)
