extends Node

@onready var enemy_speed = 0.6

func _process(_delta):
	self.global_position.y += enemy_speed

func _on_area_2d_area_entered(area):
	if(area.name == "enemy_world_boundary_bottom"):
		if(enemy_speed < 20):
			enemy_speed += .2
		self.global_position.x = randi_range(-790,790)
		self.global_position.y = randi_range(-470,-500)
	pass
