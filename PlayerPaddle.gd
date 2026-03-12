extends CharacterBody2D

@export var speed = 300.0
var screen_size = Vector2.ZERO

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var direction = Vector2.ZERO
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	
	
	position += direction * speed * delta
	# Stops paddle from leaving the screan
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0 + (87 * get_scale()[1]), screen_size.y - (87 * get_scale()[1]))


func _on_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
