extends RigidBody2D

var initial_pos = position.x
var moving = false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if moving and position.x >= initial_pos + (3 * 64):
		moving = false
		stop_moving()


func stop_moving():
	applied_force = Vector2(0, 0)


func trigger_move_right():
	print("triggered")
	initial_pos = position.x
	moving = true
	applied_force = Vector2(200, 0)
