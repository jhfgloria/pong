extends KinematicBody2D

export (int) var speed = 200
var velocity = Vector2.ZERO

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
		
	velocity *= speed
		
	move_and_collide(velocity * delta)
