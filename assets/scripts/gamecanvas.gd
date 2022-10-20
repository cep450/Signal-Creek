extends Node2D

#intialize game variables
onready var viewport_container = $ViewportContainer
onready var viewport = $ViewportContainer/Viewport
onready var current_level = $ViewportContainer/Viewport/Level
onready var camera = $ViewportContainer/Viewport/Level/Camera2D

func _ready():
	Gamevars.dialoguebox = $UserInterface/DialogueBox
	Gamevars.planeManager = $ViewportContainer/Viewport/Level/PlaneManager
	Gamevars.party = $ViewportContainer/Viewport/Level/PlaneManager/Overworld/PARTY
	Gamevars.portrait = $UserInterface/Portraits/MarginContainer/portrait

func _process(delta):
	viewport_container.material.set_shader_param("cam_offset", camera.pixel_perfect(delta))
	if Input.is_action_just_pressed("reset"):
		reset_level()

func reset_level():
	current_level.get_tree().change_scene(current_level.get_tree().current_scene.filename)
	

