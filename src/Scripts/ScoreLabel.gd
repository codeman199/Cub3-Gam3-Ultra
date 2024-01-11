extends Label

var score = 0

func _on_pellet_collected():
	score += 1

func _process(_delta):
	text = "Score: %s" % Global.score
