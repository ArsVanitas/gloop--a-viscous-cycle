extends State
class_name AttackState

@onready var shoot_timer = %ShootTimer
var attack_speed:
	set(new_value):
		attack_speed = new_value
		shoot_timer.wait_time = (0.5 / attack_speed)

func _ready() -> void:
	attack_speed = GlobalPlayerStats.attack_speed
	shoot_timer.wait_time = (0.5 / attack_speed)

func _process(delta: float) -> void:
	player.pivot.look_at(get_global_mouse_position())

func Update(delta):
	if (player.crosshair.global_position.x - player.global_position.x) < 0:
		%PlayerSprite.flip_h = true
		%Shadow.position.x = 5
	if (player.crosshair.global_position.x - player.global_position.x) > 0:
		%PlayerSprite.flip_h = false
		%Shadow.position.x = -5
