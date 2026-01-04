extends CharacterBody2D

const SPEED := 200.0

func _physics_process(delta: float) -> void:
	var input_dir := Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		input_dir.x += 1
	if Input.is_action_pressed("ui_left"):
		input_dir.x -= 1
	if Input.is_action_pressed("ui_down"):
		input_dir.y += 1
	if Input.is_action_pressed("ui_up"):
		input_dir.y -= 1

	# 斜め移動の速度を一定にするために正規化
	if input_dir != Vector2.ZERO:
		input_dir = input_dir.normalized()

	velocity = input_dir * SPEED
	move_and_slide()
