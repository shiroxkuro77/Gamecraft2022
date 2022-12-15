extends Node2D

signal lightning

onready var TreeNode = $TreeCloud
onready var LightningNode = $LightningCloud
onready var currNode

func _ready():
	currNode = LightningNode
	for child in get_children():
		if not child == LightningNode:
			remove_child(child)
			
func _switchNode():
	if currNode == LightningNode:
		add_child(TreeNode)
		remove_child(currNode)
		currNode = TreeNode
	elif currNode == TreeNode:
		add_child(LightningNode)
		remove_child(currNode)
		currNode = LightningNode


func _on_LightningCloud_switch():
	TreeNode.position = LightningNode.position
	add_child(TreeNode)
	remove_child(LightningNode)


func _on_TreeCloud_switch():
	LightningNode.position = TreeNode.position
	add_child(LightningNode)
	remove_child(TreeNode)


func _on_LightningCloud_lightning():
	emit_signal("lightning")
