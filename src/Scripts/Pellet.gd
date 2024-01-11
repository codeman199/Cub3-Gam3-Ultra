extends Node

signal collected

func _on_pellet_body_area_entered(area):
	if(area.name == "collect_body"):
		collected.emit()
		self.global_position.x = randi_range(32,1568)
		self.global_position.y = randi_range(32,868)
	pass
