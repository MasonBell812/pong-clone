extends CharacterBody2D

@export var speed = 300.0
var screen_size = Vector2.ZERO

func movement() -> Vector2:
	if Input.is_action_pressed("move_up_p1"):
		return Vector2(0,-1)
	if Input.is_action_pressed("move_down_p1"):
		return Vector2(0,1)
	return Vector2.ZERO

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var direction = movement()
	
	
	position += direction * speed * delta
	# Stops paddle from leaving the screan
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0 + (87 * get_scale()[1]), screen_size.y - (87 * get_scale()[1]))


func _on_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
