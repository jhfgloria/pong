extends KinematicBody2D

export (int) var speed = 200
var direction: Vector2 = Vector2.ZERO

func _physics_process(delta):
	move_and_collide(direction * speed * delta)

func follow(y: float):
	direction = Vector2(0, round(y))
