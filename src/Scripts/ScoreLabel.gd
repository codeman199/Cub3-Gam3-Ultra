extends Label

var score = 0
func _ready():
	_update_score()
	
func _on_pellet_collected():
	score += 1
	_update_score()

func _update_score():
	if(score > Global.high_score):
		Global.high_score = score
	text = "Score: %s \n High Score: %s" % [score,Global.high_score]
