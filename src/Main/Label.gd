extends Label

func _ready():
	await owner.ready
	mouse_filter = MOUSE_FILTER_STOP

func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index  == MOUSE_BUTTON_LEFT and event.pressed:
			# 在这里实现点击 `Label` 后的逻辑
			print_rich(name," is ","clicked: ", text)
