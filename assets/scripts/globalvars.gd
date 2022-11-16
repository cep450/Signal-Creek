extends Node

#declare global game variables

onready var camera = null
onready var soundManager = null

onready var dialogueBox = null
onready var portrait = null
onready var colorManager = null

onready var planeManager = null
onready var mode = Enums.Mode.WALK
onready var world = Enums.Pln.DREAM #use a bool instead? only 2 states. 

onready var player = null
onready var party = null
onready var nick = null
onready var nour = null
onready var suwan = null

#global static functions
static func delete_children(node):
	
	for n in node.get_children():
		node.remove_child(n)
		n.queue_free()
