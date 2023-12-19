extends DefaultState
@onready var jump: Node = $"../Jump"
@onready var state_machine: StateMachine = $".."


#signal camera2dshake(value:float)

var landingTime:float = 0.0 #进入落地状态的持续时间
var rigidityTime:float = 0.0 #硬直时间
var animationTime:float = 0.0 #对应动画播放时间

func enter(msg: Dictionary = {}) ->void:
	landingTime = 0.0
	rigidityTime = 0.0
	animationTime = animation_player.get_animation("landing").length

	print_rich(msg.lastState.maxFallSpeed)
	if msg.lastState.maxFallSpeed >450:
		player.shakeCamera(0.4)
	#如果下落速度大于600，启用僵直时间
	if msg.lastState.maxFallSpeed >800:
		rigidityTime = 1.5
		player.shakeCamera(0.8)

	animation_player.get_animation("landing").loop_mode = Animation.LOOP_NONE
	animation_player.play("landing")
	return
	
func _unhandled_input(event: InputEvent) -> void:
#	输入未被处理之前
	return

func tick_physics(delta:float) ->void:
	landingTime += delta
	player.JUMP_COUNT = 0
	if landingTime>rigidityTime:
		if not is_zero_approx(player.velocity.x):
			state_machine.setStateWithMsg("Running")
		else:
			state_machine.setStateWithMsg("Idle")
		commonPhysics(delta)	
		player.move_and_slide()

func exit(msg: Dictionary = {}) ->void:
	player.RUN_SPEED = player.DEFAULT_RUN_SPEED
	return
