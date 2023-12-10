@icon("res://assets/2d/icons/state_machine.svg")
class_name StateMachine extends Node

signal transitioned(target_state_path)

@export var initial_state := NodePath()

var _state_name := ""
@onready var state:DefaultState :
	get:
		return  state
	set(value):
		if value is DefaultState:
			state = value
			_state_name = state.name
			emit_signal("transitioned",state.name)

func _init() -> void:
	pass
	
func _ready() -> void:
	state = get_node("Fall") 
	await owner.ready

func _process(delta: float) -> void:
	state.tick_process(delta)

func _physics_process(delta: float) -> void:
	state.tick_physics(delta)
	
func setStateWithMsg(
	target_state_path:String,
	msg:={
		lastState =	state
	}
	)-> void:
	if not has_node(target_state_path):
		return
	var target_state := get_node(target_state_path)
	state.exit()
	self.state = target_state
	state.enter(msg)
	
	
	
	
	
	
	
	
	
	
	
	
	
