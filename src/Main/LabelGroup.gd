extends Control

func _on_state_machine_transitioned(state_path) -> void:
	var node = get_child(0)
	#text = state_path
	print_rich(state_path)
	var child = get_child(0)
	child.text = state_path
	pass # Replace with function body.
 
