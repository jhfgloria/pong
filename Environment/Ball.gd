extends KinematicBody2D

var speed: float = 0
var direction = Vector2(-1.0, -1.0)

func _ready():
	direction = Vector2(-1.0, -1.0)
	direction = direction.normalized()
	
func _physics_process(delta):
	print_debug(direction * delta * speed)
	var collision = move_and_collide(direction * delta * speed)
	if collision:
		speed += 10

		if collision.collider.get_collision_layer() == 2:
			direction.y *= -1
			
		if collision.collider.get_collision_layer() == 1:
			direction.x *= -1
			
		direction.normalized()

func set_speed(new_speed: float):
	speed = new_speed
