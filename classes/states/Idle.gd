class_name Idle extends DefaultState
@onready var state_machine: StateMachine = $".."

func tick_physics(delta:float) ->void:
	animation_player.play("idle")
	commonPhysics(delta)
	if Input.is_action_just_pressed("jump"):
		player.velocity.y = player.JUMP_SPEED
		state_machine.setStateWithMsg("Jump")
	elif not is_zero_approx(player.velocity.x):
		state_machine.setStateWithMsg("Running")

	player.move_and_slide()
