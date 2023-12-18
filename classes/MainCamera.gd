class_name CustomCamera extends Camera2D

# 定义晃动参数
var shake = 0.0
var shake_decay = 0.6  # 每秒衰减量
var max_offset = 10.0   # 最大偏移量
var max_rotation = 0.1  # 最大旋转角度（弧度）

# 增加创伤值来开始晃动
func cameraShake(range: float) -> void:
	shake = min(shake + range, 1.0)

# 每帧调用的处理函数
func _process(delta: float) -> void:
	if shake > 0:
		# 应用晃动效果
		apply_shake(delta)
		# 创伤值衰减
		shake = max(shake - shake_decay * delta, 0)

# 应用晃动效果
func apply_shake(delta: float) -> void:
	var shake_amount = shake * shake  # 晃动值的平方提供更自然的衰减
	var offset_x = randf() * 2.0 - 1.0  # 随机偏移量(-1到1)
	var offset_y = randf() * 2.0 - 1.0
	var rotation_offset = randf() * 2.0 - 1.0

	# 设置摄像机的偏移和旋转
	offset = Vector2(offset_x, offset_y) * max_offset * shake_amount
	rotation = rotation_offset * max_rotation * shake_amount


func _on_camera_shake(range:float) -> void:
	cameraShake(range)
	pass # Replace with function body.
