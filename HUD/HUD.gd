extends CanvasLayer

var player_one_score: Label
var player_two_score: Label

func _ready():
	player_one_score = $PlayerOneScore
	player_two_score = $PlayerTwoScore 

func reset():
	player_one_score.text = "0"
	player_two_score.text = "0"

func set_scores(player_one: int, player_two: int):
	player_one_score.text = String(player_one)
	player_two_score.text = String(player_two)
	
