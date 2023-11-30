@icon("res://assets/2d/icons/state_machine.svg")
class_name StateMachine extends Node

signal transitioned(state_path)

@export var initial_state := NodePath()

var _state_name := ""
@onready var state:State :
	get:
		return  state
	set(value):
		state = value
		_state_name = state.name



func _init() -> void:
	add_to_group("state_machine")
	
func _ready() -> void:
	state = get_node(initial_state) 
	await owner.ready
	state.enter()

func _unhandled_input(event: InputEvent) -> void:
	state.unhandled_input(event)

func _process(delta: float) -> void:
	state.process(delta)

func _physics_process(delta: float) -> void:
	state.physics_process(delta)
	
func transition_to(target_state_path:String,msg:={})-> void:
	if not has_node(target_state_path):
		return
	var target_state := get_node(target_state_path) 
	state.exit()
	self.state = target_state
	state.enter(msg)
	emit_signal("transitioned",target_state_path)
	
	
	
	
	
	
	
	
	
	
	
	
	
