extends Node

#change current plane you are on (dream world or real world)

onready var ground_node = $Ground
onready var walls_node = $Overworld/Walls
onready var objects = []

export (TileSet) var dreamset 
export (TileSet) var realset

#add enum

func _ready():
	for node in get_tree().get_nodes_in_group("shiftable"):
		objects.push_back(node)
	pass


func _physics_process(_delta):
	
	if Input.is_action_just_pressed("planeshift"):
		shift_planes()


func shift_planes():
	
	if Globals.world == Enums.Pln.DREAM:
		Globals.world = Enums.Pln.REAL
		set_tilesets(realset)
	else:
		Globals.world = Enums.Pln.DREAM
		set_tilesets(dreamset)

func set_tilesets(setId):
	
	ground_node.set_tileset(setId)
	walls_node.set_tileset(setId)
	set_objects_sprites()
	move_objects()


func set_objects_sprites():
	
	if Globals.world == Enums.Pln.DREAM:
		for node in objects:
			node.set_sheet(node.dreamsheet)
	else:
		for node in objects:
			node.set_sheet(node.realsheet)
	pass


func move_objects():
	if Globals.world == Enums.Pln.DREAM:
		for node in objects:
			node.set_position(node.dream_world_position)
	else:
		for node in objects:
			node.set_position(node.real_world_position)
