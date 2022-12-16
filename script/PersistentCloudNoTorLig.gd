extends Node2D

onready var TreeNode = $TreeCloud
onready var currNode

func _ready():
	currNode = TreeNode
	for child in get_children():
		if not child == TreeNode:
			remove_child(child)
			
func set_ready():
	if TreeNode:
		TreeNode.set_ready()
	
