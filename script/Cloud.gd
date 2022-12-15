extends Node2D

class_name Cloud
signal switch

# Declare member variables here. Examples:

var unitBlock = 16
var time = 0
const TIME_PERIOD = 0.1

var change_state
var animated_sprite
var persistent_state

func _timer(delta):
	time += delta
	if time > TIME_PERIOD:
		time = 0
		return true
	return false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):		
	if Input.is_action_pressed("move_left"):
		if position.x > -12:
			if _timer(delta):
				position.x -= unitBlock
	elif Input.is_action_pressed("move_right"):
		if position.x < OS.get_screen_size().x - 32:
			if _timer(delta):
				position.x += unitBlock
	elif Input.is_action_just_released("ui_up"):
		emit_signal("switch")
