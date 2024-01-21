extends Node

@onready var score_label = $GameUI/ScoreLabel

func _ready():
	_on_update_score(0,Global.high_score)

func _on_update_score(score, high_score):
	score_label.text = "Score: %s \n High Score: %s" % [score,high_score]
	pass # Replace with function body.
