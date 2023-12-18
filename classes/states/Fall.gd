extends DefaultState
@onready var state_machine: StateMachine = $".."

var maxFallSpeed = 0.0

func enter(msg: Dictionary = {}) -> void:
	maxFallSpeed = 0.0
	animation_player.get_animation("fall_before").loop_mode = Animation.LOOP_NONE
	animation_player.play("fall_before")
	animation_player.queue("fall")
	return


func tick_physics(delta:float) ->void:
	#print_rich(animation_player.current_animation)
	commonPhysics(delta)
	#获取最大下落速度
	if player.velocity.y > maxFallSpeed:
		maxFallSpeed =  player.velocity.y
	if player.is_on_floor():
		state_machine.setStateWithMsg("Landing")
	if Input.is_action_just_pressed("jump") and player.JUMP_COUNT < player.MAX_JUMPS:
		player.velocity.y = player.JUMP_SPEED
		state_machine.setStateWithMsg("Jump")
	player.move_and_slide()
	return

