extends Node

#change current plane you are on (dream or decay)

onready var ground = $Ground
onready var walls = $Overworld/Walls
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
		shiftPlane()


func shiftPlane():
	if Globals.world == Enums.Pln.DREAM:
		Globals.world = Enums.Pln.REAL
		set_tilesets(realset)
	else:
		Globals.world = Enums.Pln.DREAM
		set_tilesets(dreamset)

func set_tilesets(setId):
	ground.set_tileset(setId)
	walls.set_tileset(setId)
	set_obj_sprites()
	move_objs()


func set_obj_sprites():
	if Globals.world == Enums.Pln.DREAM:
		for node in objects:
			node.set_sheet(node.dreamsheet)
	else:
		for node in objects:
			node.set_sheet(node.realsheet)
	pass


func move_objs():
	if Globals.world == Enums.Pln.DREAM:
		for node in objects:
			node.set_pos(node.dreampos)
	else:
		for node in objects:
			node.set_pos(node.realpos)
