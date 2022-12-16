extends Node2D

var unitBlock = 64

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

#func _on_Cloud_lightning():
#	if abs($Cloud/LightningCloud.global_position.x - $Car.position.x) < unitBlock:
#		$Car.trigger_move_right()


func _process(delta):
	if name.begins_with("instructions") and Input.is_action_just_released("execute"):
		if name == "instructions_level_1":
			get_tree().change_scene("res://scene/Level1.tscn")
			return
		if name == "instructions_level_2":
			get_tree().change_scene("res://scene/Level2.tscn")
			return
		if name == "instructions_level_3":
			get_tree().change_scene("res://scene/Level3.tscn")
			return
