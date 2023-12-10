extends DefaultState
@onready var state_machine: StateMachine = $".."

func tick_physics(delta:float) ->void:
	commonPhysics(delta)
	animation_player.play("running")
	if Input.is_action_just_pressed("jump"):
		player.velocity.y = player.JUMP_SPEED
		state_machine.setStateWithMsg("Jump")
	if  player.is_on_floor() and is_zero_approx(player.velocity.x):
		state_machine.setStateWithMsg("Idle")
	if  player.velocity.y > 0:
		state_machine.setStateWithMsg("Fail")
	player.move_and_slide()
