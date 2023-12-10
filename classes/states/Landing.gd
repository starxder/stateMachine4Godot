extends DefaultState

@onready var state_machine: StateMachine = $".."

func tick_physics(delta:float) ->void:
	commonPhysics(delta)
	animation_player.play("landing")
	player.jump_count = 0
	if  is_zero_approx(player.velocity.x):
		state_machine.setStateWithMsg("Running")
	else:
		state_machine.setStateWithMsg("Idle")
	player.move_and_slide()
