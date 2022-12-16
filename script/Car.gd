extends RigidBody2D

onready var ground_ray = get_node("GroundRay2D");
onready var front_ray = get_node("FrontRay2D");
onready var collide_ray = get_node("CollideRay2D");
var initial_pos = position.x
var moving = false
var unitBlock = 64
var time = 0
const TIME_PERIOD = 0.3
var Direction = "Right"

# Called when the node enters the scene tree for the first time.
func _ready():
	moving = false

	
func _timer(delta):
	time += delta
	if time > TIME_PERIOD:
		time = 0
		return true
	return false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if _timer(delta):
		if front_ray.is_colliding():
			#Deletes tornado
			if front_ray.get_collider().name == "TornadoBody":
				ChangeDirection()
				front_ray.get_collider().get_parent().queue_free()
		if not ground_ray.is_colliding():
			position.y += unitBlock
		elif moving and (not front_ray.is_colliding()):
			MoveDirection()
		elif collide_ray.is_colliding():
			#print(collide_ray.get_collider())
			if not collide_ray.get_collider().name in "Platform":
				position.y -= unitBlock


func start_moving():
	moving = true

func stop_moving():
	moving = false

func trigger_move_right():
	initial_pos = position.x
	moving = true
	

func ChangeDirection():
	if Direction == "Left":
		$CarSprite.set_flip_h( false )
		$FrontRay2D.set_cast_to(Vector2(64,0))
		Direction = "Right"
	elif Direction == "Right":
		$CarSprite.set_flip_h( true )
		$FrontRay2D.set_cast_to(Vector2(-64,0))
		Direction = "Left"
		
func MoveDirection():
	if Direction == "Left":
		position.x -= unitBlock
	elif Direction == "Right":
		position.x += unitBlock

