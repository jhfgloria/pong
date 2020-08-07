extends Node2D

var ball: KinematicBody2D
var enemy: KinematicBody2D

func _ready():
	ball = $Ball
	enemy = $Enemy

func _physics_process(_delta):
	if ball.position.y > enemy.position.y && ball.direction.y > 0:
		enemy.follow(ball.direction.y)
		
	elif ball.position.y < enemy.position.y && ball.direction.y < 0:
		enemy.follow(ball.direction.y)
		
	else:
		enemy.follow(0)
