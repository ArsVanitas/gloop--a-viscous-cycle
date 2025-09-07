extends State
class_name MoveState

var dash_max := int(500)
var dashspeed := int(300)
var dash_direction := Vector2(0,0)

func Enter():
	animator.play("walk")

func Update(delta: float) -> void:
	if player.velocity.length() == 0:
		state_transition.emit(self, fsm.idle)
	
	if Input.is_action_just_pressed("shoot") and fsm.can_shoot:
		state_transition.emit(self, fsm.shoot)
	
	if Input.is_action_just_pressed("melee") and fsm.can_melee:
		state_transition.emit(self, fsm.melee)
	
	if Input.is_action_just_pressed("dash") and player.stats.can_dash:
		start_dash(player.direction)
		%DashCD.start()
	
	LessenDash(delta)
	player.velocity = player.direction * GlobalPlayerStats.move_speed + dash_direction * dashspeed
	player.move_and_slide()

func start_dash(direction):
	dash_max = 2 * player.stats.move_speed
	dash_direction = player.direction
	dashspeed = dash_max
	player.stats.can_dash = false
	#can_take_damage = false
	player.set_collision_mask_value(2, false)
	%DashCD.start()
	await %DashCD.timeout
	dashspeed = 0
	#can_take_damage = false
	player.stats.can_dash = true
	player.set_collision_mask_value(2, true)

func LessenDash(delta):
	#Higher multiplier values makes the dash shorter
	var multiplier = 4.0
	var timemultiplier = 4.1
	
	#slow down the dash over time, both as a fraction of dashspeed and also time
	#While clamping it between 0 and dash_max
	dashspeed -= (dashspeed * multiplier * delta) + (delta * timemultiplier)
	dashspeed = clamp(dashspeed, 0, dash_max)
	
	if(dashspeed <= 0):
		#can_take_damage = true
		dash_direction = Vector2.ZERO
