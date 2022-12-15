extends Node2D

var unitBlock = 64

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

#func _on_Cloud_lightning():
#	if abs($Cloud/LightningCloud.global_position.x - $Car.position.x) < unitBlock:
#		$Car.trigger_move_right()




func _on_Button_pressed():
	if name == "instructions_level_1":
		get_tree().change_scene("res://scene/Level1.tscn")
	
	if name == "instructions_level_2":
		get_tree().change_scene("res://scene/Level2.tscn")
		
	if name == "instructions_level_3":
		get_tree().change_scene("res://scene/Level3.tscn")
