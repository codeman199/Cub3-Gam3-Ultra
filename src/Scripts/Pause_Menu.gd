extends ColorRect

signal returnToMenu

func _on_pause_button_pressed():
	get_tree().paused = true
	show()
	pass # Replace with function body.

func _on_back_to_game_pressed():
	hide()
	get_tree().paused = false
	pass # Replace with function body.

func _on_return_to_main_menu_pressed():
	get_tree().paused = false
	returnToMenu.emit()
	Global.goto_scene("res://src/Scenes/main_scene.tscn")
	pass
