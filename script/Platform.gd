extends StaticBody2D

var initial_ypos
var max_block_distance = 5
var unitBlock = 64
const TIME_PERIOD = 0.5
var yDirection = "up"
var time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	initial_ypos = position.y
	
func _timer(delta):
	time += delta
	if time > TIME_PERIOD:
		time = 0
		return true
	return false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if _timer(delta):
		if abs(position.y - initial_ypos) >= max_block_distance * unitBlock:
			ChangeDirection()
			initial_ypos = position.y
		else:
			MoveDirection()
		

func ChangeDirection():
	if yDirection == "up":
		yDirection = "down"
	elif yDirection == "down":
		yDirection = "up"

		
func MoveDirection():
	if yDirection == "up":
		position.y -= unitBlock
	elif yDirection == "down":
		position.y += unitBlock


