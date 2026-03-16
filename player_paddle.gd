extends "res://PlayerPaddle.gd"

func movement() -> Vector2:
	if Input.is_action_pressed("move_up_p2"):
		return Vector2(0,-1)
	if Input.is_action_pressed("move_down_p2"):
		return Vector2(0,1)
	return Vector2.ZERO
