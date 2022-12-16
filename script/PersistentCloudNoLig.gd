extends Node2D

onready var TreeNode = $TreeCloud
onready var TornadoNode = $TornadoCloud
onready var currNode

func _ready():
	currNode = TreeNode
	for child in get_children():
		if child != TreeNode and child != $SwitchCloudSound:
			remove_child(child)
			

func set_ready():
	if TreeNode:
		TreeNode.set_ready()
	if TornadoNode:
		TornadoNode.set_ready()
	
func _on_TreeCloud_switchToTornado():
	TornadoNode.position = TreeNode.position
	add_child(TornadoNode)
	TreeNode.get_node("SeedImpactSound").stop()
	remove_child(TreeNode)
	$SwitchCloudSound.play()


func _on_TreeCloud_switchToTree():
	pass


func _on_TornadoCloud_switchToTornado():
	pass


func _on_TornadoCloud_switchToTree():
	TreeNode.position = TornadoNode.position
	add_child(TreeNode)
	TornadoNode.get_node("WindSound").stop()
	remove_child(TornadoNode)
	$SwitchCloudSound.play()
