extends DefaultState
@onready var state_machine: StateMachine = $".."

func _unhandled_input(event: InputEvent) -> void:
#	输入未被处理之前
	if event.is_action_released("jump") and  player.velocity.y < player.JUMP_SPEED/2 and player.JUMP_COUNT < player.MAX_JUMPS+1:
		player.velocity.y = player.JUMP_SPEED/2
	return

func enter(msg: Dictionary = {}) -> void:
	animation_player.get_animation("jump_before").loop_mode = Animation.LOOP_NONE
	animation_player.play("jump_before")
	animation_player.queue("jump")
	player.JUMP_COUNT = player.JUMP_COUNT + 1
	return
	

func tick_physics(delta:float) ->void:
	commonPhysics(delta)
	if Input.is_action_just_pressed("jump") and player.JUMP_COUNT < player.MAX_JUMPS:
		player.JUMP_COUNT = player.JUMP_COUNT + 1
		player.velocity.y = player.JUMP_SPEED
	if player.velocity.y >= 0:
		state_machine.setStateWithMsg("Fall")
	player.move_and_slide()
