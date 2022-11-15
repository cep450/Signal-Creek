extends Node2D

onready var planeManager = $PlaneManager
export(Vector2) var party_starting_position = Vector2(260, 140)
export(Vector2) var camera_bounds_min = Vector2(0,0)
export(Vector2) var camera_bounds_max = Vector2(464, 320)

	
func get_planeManager():
	return planeManager
	
func place_party(partyNode):
	$PlaneManager/Overworld.add_child(partyNode)
	partyNode.set_global_position(party_starting_position)
	print(partyNode.get_global_position())
	self.add_child(Globals.camera)
	Globals.camera.set_camera_bounds(camera_bounds_min, camera_bounds_max)
	print(camera_bounds_max)
	
func remove_party(partyNode):
	$PlaneManager/Overworld.remove_child(partyNode)
	self.remove_child(Globals.camera)
#
