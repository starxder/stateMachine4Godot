class_name DefaultState extends Node

@onready var player: Player = $"../.."
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var sprite_2d: Sprite2D = $"../../Sprite2D"

var gravity :=ProjectSettings.get("physics/2d/default_gravity") as float

func enter(msg: Dictionary = {}) -> void:
	return


func exit() -> void:
	return

func _unhandled_input(event: InputEvent) -> void:
#	输入未被处理之前
	return
	

func tick_process(delta:float) ->void:
	return
	
func commonPhysics(delta:float) ->void:
	var direction := Input.get_axis("move_left","move-right")
	player.velocity.x = direction*player.RUN_SPEED
	player.velocity.y += gravity * delta
	if not is_zero_approx(player.velocity.x):
		sprite_2d.flip_h = player.velocity.x < 0
	
	
func tick_physics(delta:float) ->void:
	commonPhysics(delta)
	player.move_and_slide()
