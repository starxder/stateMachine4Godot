extends Label

var focusFlag := false

func _on_state_machine_transitioned(state_path) -> void:
	text = state_path
	pass # Replace with function body.
