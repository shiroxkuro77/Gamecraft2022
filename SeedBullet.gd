extends RigidBody2D

onready var nextState = get_node("RigidBody2DGrow1")
var currPos
var isMoving = true
var time = 0
var TIME_PERIOD = 0.1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _timer(delta):
	time += delta
	if time > TIME_PERIOD:
		time = 0
		return true
	return false


func _process(delta):
	if _timer(delta):
		if currPos == null:
			currPos = position
			isMoving = true
		elif position == currPos:
			isMoving = false
		else:
			currPos = position
			isMoving = true
		if not isMoving:
			get_node("RigidBody2D/SpriteSeed").queue_free()
			pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

