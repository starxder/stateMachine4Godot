extends DefaultState
@onready var state_machine: StateMachine = $".."

func tick_physics(delta:float) ->void:
	commonPhysics(delta)
	animation_player.play("fall")
	if player.is_on_floor():
		state_machine.setStateWithMsg("Landing")
	if Input.is_action_just_pressed("jump") and player.jump_count < player.MAX_JUMPS:
		player.velocity.y = player.JUMP_SPEED
		state_machine.setStateWithMsg("Jump")
	player.move_and_slide()
