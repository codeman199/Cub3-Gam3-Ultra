extends ColorRect

func _on_pause_button_pressed():
	print("PAUSE")
	get_tree().paused = true
	show()
	pass # Replace with function body.

func _on_back_to_game_pressed():
	print("UNPAUSE")
	hide()
	get_tree().paused = false
	pass # Replace with function body.
