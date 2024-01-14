extends Node

@onready var pellet_scene = load("res://src/Scenes/pellet.tscn")

func _ready():
	$UserInterface/Retry.hide()
	$UserInterface/Paused.hide()
	
func _on_player_hit():
	$UserInterface/Retry.show()

func _on_pellet_collected():
	$PopSound.play()
	$Player._update_speed()
	var pellet = pellet_scene.instantiate()
	pellet.global_position.x = randi_range(-750,750)
	pellet.global_position.y = randi_range(-400,400)
	pellet.collected.connect(self._on_pellet_collected.bind())
	pellet.collected.connect($UserInterface/GameUI/ScoreLabel._on_pellet_collected.bind())
	$Pellets.add_child(pellet)
		
func _unhandled_input(event):
	if event.is_action_pressed("ui_accept") and $UserInterface/Retry.visible:
		get_tree().reload_current_scene()

