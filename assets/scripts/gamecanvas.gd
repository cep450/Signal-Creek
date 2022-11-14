extends Node2D

#manages viewport, ui, plane stuff

#intialize game variables
onready var viewport_container = $ViewportContainer
onready var viewport = $ViewportContainer/Viewport

onready var current_level = $ViewportContainer/Viewport/Level
onready var camera = $ViewportContainer/Viewport/Level/Camera2D

var room_warmSubject = preload("res://assets/scenes/rooms/room_warmSubject.tscn")
var room_BandN = preload("res://assets/scenes/rooms/room_bAndN.tscn")
var room_hallway = preload("res://assets/scenes/rooms/room_hallway.tscn")
var room_topicSpot = preload("res://assets/scenes/rooms/room_topicSpot.tscn")

var rooms = [room_BandN, room_hallway, room_topicSpot]
var roomIndex = 0


export var camWidth : int = 320
export var camHeight : int = 180

func _ready():
	Globals.dialoguebox = $UserInterface/ReferenceRect/DialogueBox
	Globals.planeManager = $ViewportContainer/Viewport/Level/PlaneManager
	Globals.party = $ViewportContainer/Viewport/Level/PlaneManager/Overworld/PARTY
	
	Globals.portrait = $UserInterface/ReferenceRect/Portraits/MarginContainer/portrait
	
	
	camera.rescale_camera(floor(OS.window_size.x/camWidth))
	

func _process(delta):
	viewport_container.material.set_shader_param("cam_offset", camera.pixel_perfect(delta))
	if Input.is_action_just_pressed("room_toggle"):
		cycle_rooms()
	if Input.is_action_just_pressed("reset"):
		reset_level()
		
func reset_level():
	current_level.get_tree().change_scene(current_level.get_tree().current_scene.filename)
	
func set_level(levelnode):
	var oldLevel = current_level
	var thisRoom = levelnode.instance()
	viewport.add_child(thisRoom)
	
	current_level = thisRoom
	
	oldLevel.remove_party(Globals.party)
	thisRoom.place_party(Globals.party)
	
	
	Globals.planeManager = thisRoom.get_planeManager()

	viewport.remove_child(oldLevel)

func cycle_rooms():
	roomIndex += 1
	if roomIndex >= rooms.size():
		roomIndex = 0
	set_level(rooms[roomIndex])
	print(current_level)
