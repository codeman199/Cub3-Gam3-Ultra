extends Node

@onready var pellet_scene = load("res://src/Scenes/pellet.tscn")

signal update_score

var score = 0
var pellet_value = 1

func _ready():
	$UserInterface/Retry.hide()
	$UserInterface/Paused.hide()
	
func _on_player_hit():
	$UserInterface/Retry.show()

func _on_pellet_collected():
	$PopSound.play()
	_update_score()
	$Player._update_speed()
	var pellet = pellet_scene.instantiate()
	pellet.global_position.x = randi_range(-750,750)
	pellet.global_position.y = randi_range(-400,400)
	pellet.collected.connect(self._on_pellet_collected.bind())
	$PelletContainer.call_deferred("add_child",pellet)

func _update_score():
	score += pellet_value
	if(score > Global.high_score):
		Global.high_score = score
	update_score.emit(score,Global.high_score)

func _unhandled_input(event):
	if event.is_action_pressed("ui_accept") and $UserInterface/Retry.visible:
		get_tree().reload_current_scene()

func save_scene():
	var scene = PackedScene.new()
	scene.pack(get_tree().get_current_scene())
	ResourceSaver.save(scene,"res://src/Scenes/game_scene.tscn")

func _on_paused_return_to_menu():
	#save_scene()
	pass


func _on_update_score():
	pass # Replace with function body.
