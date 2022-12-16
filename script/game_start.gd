extends Node


func _ready():
	var screen_size = OS.get_screen_size()
	var window_size = OS.get_window_size()
	OS.set_window_position(screen_size*0.5 - window_size*0.5)
	

func _on_start_game_button_pressed():
	get_tree().change_scene("res://scene/instructions_level_1.tscn")
