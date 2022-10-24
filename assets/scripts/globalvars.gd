extends Node

#declare global game variables

onready var player = null
onready var mode = Enums.Mode.WALK
onready var dialoguebox = null
onready var planeManager = null
onready var party = null
onready var portrait = null
onready var world = Enums.Pln.REAL #use a bool instead? only 2 states. 
