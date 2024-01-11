extends Node

func _ready():
	$UserInterface/Retry.hide()
	
func _on_player_hit():
	$UserInterface/Retry.show()
	
func _unhandled_input(event):
	if event.is_action_pressed("ui_accept") and $UserInterface/Retry.visible:
		Global.score = 0
		Global.player_speed = 100
		Global.enemy_speed = 1
		get_tree().reload_current_scene()
