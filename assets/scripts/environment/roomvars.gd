extends Node2D

onready var planeManager = $PlaneManager
export(Vector2) var starting_position = Vector2(260, 140)

export(Vector2) var camera_min = Vector2(0,0)
export(Vector2) var camera_max = Vector2(464, 320)

	
func get_planeManager():
	return planeManager
	
func place_party(partyNode):

	$PlaneManager/Overworld.add_child(partyNode)
	partyNode.set_global_position(starting_position)
	print(partyNode.get_global_position())
	self.add_child(Globals.camera)
	Globals.camera.set_camera_bounds(camera_min, camera_max)
	print(camera_max)
	
	
	
func remove_party(partyNode):
	$PlaneManager/Overworld.remove_child(partyNode)
	self.remove_child(Globals.camera)
