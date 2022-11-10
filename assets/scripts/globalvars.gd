extends Node

#declare global game variables

onready var player = null
onready var mode = Enums.Mode.WALK
onready var dialoguebox = null
onready var planeManager = null
onready var party = null
onready var portrait = null
onready var world = Enums.Pln.REAL #use a bool instead? only 2 states. 
onready var camera = null

onready var nick = null
onready var nour = null
onready var suwan = null


#save data loading and saving 
#var SaveDataManager = preload("res://assets/scripts/Data/SaveDataManager.cs")
#var saveDataManager = SaveDataManager.new()
var narrativeData = null

func _init():
	#saveDataManager = SaveDataManager.new()
	#saveDataManager.Load()
	pass

#in the future, will save data to disc, called when closing the game.
func save():
	#saveDataManager.Save()
	pass
