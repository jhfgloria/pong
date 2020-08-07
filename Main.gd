extends Node2D

onready var ball: KinematicBody2D = $Ball
onready var enemy: KinematicBody2D = $Enemy
onready var hud: CanvasLayer = $HUD
onready var initial_position: Position2D = $InitialPosition
onready var startup_timer: Timer = $StartupTimer

export (float) var ball_speed = 200.0

var player_one_score = 0
var player_two_score = 0
var time_left = 3

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

func _on_HUD_start_game():
	time_left = 3
	hud.set_message(String(time_left))
	hud.show_message()
	startup_timer.start(1)

func _on_StartupTimer_timeout():
	if time_left > 1:
		time_left -= 1
		hud.set_message(String(time_left))
	else:
		startup_timer.stop()
		hud.hide_message()
		ball.show()
		ball.set_speed(ball_speed)
