extends YSort

var partyMembers = [Enums.Char.NICK, Enums.Char.NOUR, Enums.Char.SUWAN]
onready var characterObjects = [self.get_child(0), self.get_child(1), self.get_child(2)]

export(Array, Texture) onready var portraits = []

var leaderIndex = 0 setget update_leader_to #Keeps track of the current leader.

func _ready():
	Globals.nick = characterObjects[0]
	Globals.nour = characterObjects[1]
	Globals.suwan = characterObjects[2]
	pass

func _process(_delta):
	if Globals.mode == Enums.Mode.WALK:
		check_input()

func _physics_process(_delta):
	if Globals.mode == Enums.Mode.WALK:
		check_input_physics()

func check_input_physics():
	
	var directionVector = Vector2(0,0)

	if Input.is_action_pressed("ui_up"):
		directionVector += Vector2.UP
		
	if Input.is_action_pressed("ui_down"):
		directionVector += Vector2.DOWN
	
	if Input.is_action_pressed("ui_left"):
		directionVector += Vector2.LEFT
		
	if Input.is_action_pressed("ui_right"):
		directionVector += Vector2.RIGHT
	
	characterObjects[leaderIndex].move(directionVector)
	characterObjects[wrapi(leaderIndex + 1, 0,3)].pathfind_to(get_leader())
	characterObjects[wrapi(leaderIndex - 1, 0,3)].pathfind_to(get_leader())

func check_input():
	if Input.is_action_just_pressed("char_switch_left"):
		rotate_leader_left()
	if Input.is_action_just_pressed("char_switch_right"):
		rotate_leader_right()


#called by key input- TODO
func rotate_leader_left():
	leaderIndex = wrapi(leaderIndex - 1, 0,3)

#called by key input- TODO 
func rotate_leader_right():
	leaderIndex = wrapi(leaderIndex + 1, 0,3)

#called automatically whenever leaderIndex is changed, thanks to setget.
#changes the index variable, updates UI, any other logic anywhere else using signals.
func update_leader_to(newIndex):
	leaderIndex = newIndex
	Globals.portrait.set_texture(portraits[leaderIndex])

	#camera centers on this character
	Globals.camera.following = characterObjects[leaderIndex]

	#TODO: play a sound?

	#TODO: send a signal that we've switched to a specific character, maybe 

func get_leader():
	return characterObjects[leaderIndex]

func get_leader_inkname():
	return get_leader().inkName

func leader_nick():
	return leaderIndex == 0
func leader_nour():
	return leaderIndex == 1
func leader_suwan():
	return leaderIndex == 2
