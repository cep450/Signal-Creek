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

#change TileMaps to specified TileSet
func shiftPlane():
	if Gamevars.dream:
		Gamevars.dream = false
		Gamevars.plane = "real"
		set_tilesets(realset)
	else:
		Gamevars.dream = true
		Gamevars.plane = "dream"
		set_tilesets(dreamset)

func set_tilesets(setId):
	ground.set_tileset(setId)
	walls.set_tileset(setId)
	set_obj_sprites()
	move_objs()

func set_obj_sprites():
	if Gamevars.dream:
		for node in objects:
			node.set_sheet(node.dreamsheet)
	else:
		for node in objects:
			node.set_sheet(node.realsheet)
	pass

func move_objs():
	if Gamevars.dream:
		for node in objects:
			node.set_pos(node.dreampos)
	else:
		for node in objects:
			node.set_pos(node.realpos)