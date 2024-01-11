extends CharacterBody2D

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * Global.player_speed

func _physics_process(_delta):
	get_input()
	move_and_slide()
