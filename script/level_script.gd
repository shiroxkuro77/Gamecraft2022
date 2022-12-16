extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var is_ready = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_ready == false and Input.is_key_pressed(KEY_ENTER):
		is_ready = true
		$ReadyScreen.hide()
		$Car.start_moving()
		$Cloud.set_ready()

func _on_ResetButton_pressed():
	get_tree().reload_current_scene()

func _on_Car_reachedGoal():
	if name == "Level1":
		get_tree().change_scene("res://scene/instructions_level_2.tscn")
	if name == "Level2":
		get_tree().change_scene("res://scene/instructions_level_3.tscn")
	if name == "Level3":
		get_tree().change_scene("res://scene/Level4.tscn")	
	if name == "Level4":
		get_tree().change_scene("res://scene/Level5.tscn")	
	if name == "Level5":
		get_tree().change_scene("res://scene/End.tscn")
