extends Area2D

@export var speed = 300.0
var velocity = Vector2(250,250)
var screen_size = Vector2.ZERO
var direction = Vector2.ZERO

func _ready():
	screen_size = get_viewport_rect().size
	direction.x = -1
	
func _process(delta):
	
	position += direction * speed * delta


func _on_player_paddle_area_entered(area: Area2D) -> void:
	direction.x = 1
