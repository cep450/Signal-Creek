extends Node2D

onready var camera = $Camera2D
onready var planeManager = $PlaneManager
export(Vector2) var starting_position

func get_camera():
	return camera
	
func get_planeManager():
	return planeManager
	
func place_party(partyNode):
	$PlaneManager/Overworld.add_child(partyNode)
	partyNode.set_position(starting_position)
	self.add_child(Globals.camera)
	
	
func remove_party(partyNode):
	$PlaneManager/Overworld.remove_child(partyNode)
	self.remove_child(camera)
