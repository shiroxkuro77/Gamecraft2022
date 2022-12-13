extends RigidBody2D

onready var ground_ray = get_node("GroundRay2D");
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

func _timer(delta):
	time += delta
	if time > TIME_PERIOD:
		time = 0
		return true
	return false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if _timer(delta):
		if moving:
			#AnimatedSprite.play("go_right")
			position.x += unitBlock
			if position.x >= initial_pos + (moveSteps * unitBlock):
				stop_moving()
		if not ground_ray.is_colliding():
			position.y += unitBlock

func stop_moving():
	moving = false
	$AnimatedSprite.stop()


func trigger_move_right():
	print("triggered")
	initial_pos = position.x
	moving = true
