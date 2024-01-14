extends Node

signal collected
	
func collect():
	collected.emit()
	queue_free()
