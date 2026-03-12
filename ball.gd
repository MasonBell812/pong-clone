extends CharacterBody2D

var speed = 300.0
#velocity = Vector2(250,250)
var screen_size = Vector2.ZERO
var direction = Vector2.LEFT
var max_bounce_angle := deg_to_rad(75)

func bounce_from_paddle(paddle, collision):
	var paddle_height = paddle.get_node("CollisionShape2D").shape.size.y

	var relative = collision.get_position().y - paddle.global_position.y
	var normalized = relative / (paddle_height / 2)

	normalized = clamp(normalized, -1.0, 1.0)

	var angle = normalized * max_bounce_angle

	direction.x = -sign(direction.x) * cos(angle)
	direction.y = sin(angle)
	direction = direction.normalized()

func _ready():
	screen_size = get_viewport_rect().size
	velocity.x = -speed
	#direction.x = -1
	
func _physics_process(delta):
	#position += direction * speed * delta
	velocity = direction * speed
	var collision = move_and_collide(velocity * delta)
	if collision:
		var collider = collision.get_collider()
		if collider.is_in_group("paddle"):
			bounce_from_paddle(collider, collision)
		else:
			direction = direction.bounce(collision.get_normal()).normalized()
		


#func _on_player_paddle_area_entered(area: Area2D) -> void:
	#direction.x = 1
