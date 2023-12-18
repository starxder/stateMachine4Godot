class_name Player extends CharacterBody2D

const DEFAULT_RUN_SPEED := 260.0
const DEFAULT_JUMP_SPEED := -300.0
const DEFAULT_MAX_JUMPS := 3
const DEFAULT_JUMP_COUNT := 3

var RUN_SPEED := 260.0
var JUMP_SPEED := -300.0
var MAX_JUMPS := 3
var JUMP_COUNT := 3

func _process(delta: float) -> void:
	pass
	
signal cameraShake
func shakeCamera(range: float)-> void:
	emit_signal("cameraShake",range)
	
  
