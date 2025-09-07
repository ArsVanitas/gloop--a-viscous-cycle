extends State
class_name PlayerShoot

@export var movement : MoveState
const projectile_node = preload("uid://brp8wx0p1udkj")
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

func Enter():
	shoot()
	if Input.is_action_pressed("shoot") and fsm.can_shoot:
		shoot()
		await animator.animation_finished
	
	if Input.is_action_just_released("shoot"):
		await animator.animation_finished
		state_transition.emit(self, fsm.idle)

func Update(delta):
	if (player.crosshair.global_position.x - player.global_position.x) < 0:
		%PlayerSprite.flip_h = true
		%Shadow.position.x = 5
	if (player.crosshair.global_position.x - player.global_position.x) > 0:
		%PlayerSprite.flip_h = false
		%Shadow.position.x = -5
	
	if Input.is_action_pressed("shoot") and fsm.can_shoot:
		shoot()
		await animator.animation_finished
	
	if Input.is_action_just_released("shoot"):
		await animator.animation_finished
		state_transition.emit(self, fsm.idle)
	
	if player.stats.SETS.has(GlobalPlayerStats.Set.MOBILE):
		movement.Update(delta)

func shoot():
	animator.play("shoot", -1, attack_speed)
	var projectile = projectile_node.instantiate()
	projectile.attack_range = GlobalPlayerStats.attack_range
	projectile.global_position = player.crosshair.global_position
	projectile.global_rotation = player.crosshair.global_rotation
	projectile.set_collision_mask_value(1, false)
	add_child(projectile)
	
	fsm.can_shoot = false
	shoot_timer.start()
	await shoot_timer.timeout
	fsm.can_shoot = true
