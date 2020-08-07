extends CanvasLayer

onready var player_one_score: Label = $PlayerOneScore
onready var player_two_score: Label = $PlayerTwoScore
onready var start_game_btn: Button = $StartGame
signal start_game

func _ready():
	 pass

func reset():
	start_game_btn.show()
	player_one_score.text = "0"
	player_two_score.text = "0"

func set_scores(player_one: int, player_two: int):
	player_one_score.text = String(player_one)
	player_two_score.text = String(player_two)
	
func _on_StartGame_button_up():
	start_game_btn.hide()
	emit_signal("start_game")
