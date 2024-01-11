extends Node

signal hit

func _on_player_body_area_entered(area):
	if(area.name == "enemy_body"):
		hit.emit()
		queue_free()
	pass


func _on_collect_radius_area_entered(area):
	if(area.name == "pellet_body"):
		Global.score += 1
		Global.player_speed += 10
		print(Global.score)
	pass
