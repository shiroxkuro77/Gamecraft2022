extends Node2D

onready var TreeNode = $TreeCloud
onready var TornadoNode = $TornadoCloud
onready var currNode

func _ready():
	currNode = TreeNode
	for child in get_children():
		if not child == TreeNode:
			remove_child(child)
			

func set_ready():
	if TreeNode:
		TreeNode.set_ready()
	if TornadoNode:
		TornadoNode.set_ready()
	
func _on_TreeCloud_switchToTornado():
	TornadoNode.position = TreeNode.position
	add_child(TornadoNode)
	remove_child(TreeNode)


func _on_TreeCloud_switchToTree():
	pass


func _on_TornadoCloud_switchToTornado():
	pass


func _on_TornadoCloud_switchToTree():
	TreeNode.position = TornadoNode.position
	add_child(TreeNode)
	remove_child(TornadoNode)
