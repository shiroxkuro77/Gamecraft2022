extends RigidBody2D

onready var nextState = get_node("RigidBody2DGrow1")
var currPos
var isMoving = true

func _process(delta):
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


