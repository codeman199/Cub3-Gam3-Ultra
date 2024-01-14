extends CharacterBody2D

@onready var speed = 100

signal hit

func _update_speed():
	speed += 10;

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(_delta):
	get_input()
	move_and_slide()

func _on_player_body_area_entered(area):
	if(area.name == "enemy_body"):
		hit.emit()
		queue_free()
	pass

func _on_collect_body_area_entered(area):
	if(area.name == "pellet_body"):
		area.get_parent().collect()
	pass
