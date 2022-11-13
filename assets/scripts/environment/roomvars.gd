extends Node2D

onready var planeManager = $PlaneManager
export(Vector2) var starting_position = Vector2(260, 140)

	
func get_planeManager():
	return planeManager
	
func place_party(partyNode):
	$PlaneManager/Overworld.add_child(partyNode)
	partyNode.set_global_position(starting_position)
	print(partyNode.get_global_position())
	self.add_child(Globals.camera)
	
	
func remove_party(partyNode):
	$PlaneManager/Overworld.remove_child(partyNode)
	self.remove_child(Globals.camera)
