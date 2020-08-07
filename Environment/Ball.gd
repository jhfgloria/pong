extends KinematicBody2D

export (int) var speed = 200
var direction = Vector2(-1.0, -1.0)

func _ready():
	direction = Vector2(-1.0, -1.0)
	direction = direction.normalized()
	
func _physics_process(delta):
	var collision = move_and_collide(direction * delta * speed)
	if collision:
		speed += 10

		if collision.collider.get_collision_layer() == 2:
			direction.y *= -1
			
		if collision.collider.get_collision_layer() == 1:
			direction.x *= -1
			
		direction.normalized()
