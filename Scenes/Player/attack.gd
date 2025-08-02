extends State
class_name AttackStatePlayer

const projectile_node = preload("uid://brp8wx0p1udkj")
@onready var pivot = %CrosshairMark
@onready var crosshair = %Crosshair
@onready var attack_speed = %AttackSpeed
var can_shoot : bool = true

func _process(delta: float) -> void:
	pivot.look_at(get_global_mouse_position())
	if Input.is_action_pressed("shoot") and can_shoot:
		shoot()

func shoot():
	var projectile = projectile_node.instantiate()
	projectile.range = player.stats.range
	projectile.global_position = crosshair.global_position
	projectile.global_rotation = crosshair.global_rotation
	add_child(projectile)
	attack_speed.start()
	can_shoot = false
	await attack_speed.timeout
	can_shoot = true
