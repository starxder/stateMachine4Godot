extends Label

func _on_state_machine_transitioned(state:String)-> void:
	text = state
	
