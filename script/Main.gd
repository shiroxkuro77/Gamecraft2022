extends Node2D

var unitBlock = 64

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_Cloud_lightning():
	if abs($Cloud/LightningCloud.global_position.x - $Car.position.x) < unitBlock:
		$Car.trigger_move_right()

