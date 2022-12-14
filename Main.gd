extends Node2D

var unitBlock = 64

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_LightningCloud_lightning():
	print("main triggered")
	print($LightningCloud.position.x, " ", $Car.position)
	if abs($LightningCloud.position.x - $Car.position.x) < unitBlock:
		$Car.trigger_move_right()


func _on_Cloud_lightning():
	pass # Replace with function body.
