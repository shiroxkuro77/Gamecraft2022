extends RigidBody2D

var initial_pos = position.x
var moving = false
var unitBlock = 16
var time = 0
var moveSteps = 5
const TIME_PERIOD = 0.1
# Declare member variables here. Examples:

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	if time > TIME_PERIOD:
		if moving:
			#AnimatedSprite.play("go_right")
			position.x += unitBlock
			if position.x >= initial_pos + (moveSteps * unitBlock):
				stop_moving()
		time = 0

func stop_moving():
	moving = false
	$AnimatedSprite.stop()


func trigger_move_right():
	print("triggered")
	initial_pos = position.x
	moving = true
