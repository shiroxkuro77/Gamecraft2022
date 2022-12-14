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
			
func _switchNode():--- Debugging process started ---
Godot Engine v3.5.1.stable.official.6fed1ffa3 - https://godotengine.org
OpenGL ES 3.0 Renderer: NVIDIA GeForce GTX 1070 Ti/PCIe/SSE2
Async. shader compilation: OFF
 
--- Debugging process stopped ---
Switch Scene Tab
Switch Scene Tab
Switch Scene Tab
Switch Scene Tab
 res://LightningCloud.gd:4 - Parse Error: Unique global class "LightningCloud" already exists at path: res://script/LightningCloud.gd
Switch Scene Tab
Switch Scene Tab
Switch Scene Tab
Switch Scene Tab
Switch Scene Tab
Switch Scene Tab
Switch Scene Tab
 scene/main/node.cpp:1753 - Condition "!common_parent" is true. Returned: NodePath()
 scene/main/node.cpp:1753 - Condition "!common_parent" is true. Returned: NodePath()
Paste Node(s)
Reparent Node
Cut Node(s)

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
