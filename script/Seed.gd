extends Node2D

onready var ground_ray = get_node("GroundRay2D");
var time = 0
var TIME_PERIOD = 0.1
var unitBlock = 16

func _timer(delta):
	time += delta
	if time > TIME_PERIOD:
		time = 0
		return true
	return false
	
func _process(delta):
	if _timer(delta):
		if not ground_ray.is_colliding():
			position.y += unitBlock
