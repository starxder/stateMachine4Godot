extends State

func unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		_state_machine.transition_to("Run")
