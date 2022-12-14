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
	#add_child(TreeNode)
	#add_child($LightningCloud)
	#remove_child($LightningCloud)

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
	add_child(TreeNode)
	remove_child(LightningNode)


func _on_TreeCloud_switch():
	add_child(LightningNode)
	remove_child(TreeNode)
