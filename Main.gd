extends Node2D

onready var ball: KinematicBody2D = $Ball
onready var enemy: KinematicBody2D = $Enemy
onready var hud: CanvasLayer = $HUD
onready var initial_position: Position2D = $InitialPosition

var player_one_score = 0
var player_two_score = 0

func _ready():
	ball.position = initial_position.position
	hud.reset()

func _physics_process(_delta):
	if ball.position.y > enemy.position.y && ball.direction.y > 0:
		enemy.follow(ball.direction.y)
		
	elif ball.position.y < enemy.position.y && ball.direction.y < 0:
		enemy.follow(ball.direction.y)
		
	else:
		enemy.follow(0)

func _on_PlayerTwoGoal_body_entered(body):
	player_one_score += 1
	ball.position = initial_position.position
	update_scores()

func _on_PlayerOneGoal_body_entered(body):
	player_two_score += 1
	ball.position = initial_position.position
	update_scores()

func update_scores():
	hud.set_scores(player_one_score, player_two_score)
