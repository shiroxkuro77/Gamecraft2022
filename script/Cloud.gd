extends Node2D

class_name Cloud
signal switchToLightning
signal switchToTree
signal switchToTornado

# Declare member variables here. Examples:
var unitBlock = 64

var is_ready = false

var change_state
var animated_sprite
var persistent_state


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_ready == false:
		return
	
	if Input.is_action_just_pressed("move_left"):
		if global_position.x > 32:
			global_position.x -= unitBlock
	elif Input.is_action_just_pressed("move_right"):
		if global_position.x < get_viewport_rect().size.x * 1.5 - 32:
			global_position.x += unitBlock
	elif Input.is_action_just_pressed("z"):
		emit_signal("switchToTree")
	elif Input.is_action_just_pressed("x"):
		emit_signal("switchToTornado")
	elif Input.is_action_just_pressed("c"):
		emit_signal("switchToLightning")


func set_ready():
	is_ready = true

