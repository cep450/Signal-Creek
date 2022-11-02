extends YSort

var partyMembers = [Enums.Char.NICK, Enums.Char.NOUR, Enums.Char.SUWAN]
var characterObjects = [Globals.nick, Globals.nour, Globals.suwan]
export(Array, Texture) var portraits = []

var leaderIndex = 0 setget update_leader_to #Keeps track of the current leader.

#TODO GET RID OF THESE- TEMPORARY 
var names = ["NICK", "NOUR", "SUWAN"]

func _ready():
	pass

func _process(_delta):
	if Input.is_action_just_pressed("switch_character"):
		rotate_leader_left()
	pass

#called by key input- TODO
func rotate_leader_left(): #decrease index
	var newIndex = leaderIndex + 1
	if newIndex > 2:
		newIndex = 0
	update_leader_to(newIndex)

#called by key input- TODO 
func rotate_leader_right():	#increase index
	var newIndex = leaderIndex - 1
	if newIndex < 0:
		newIndex = 2
	update_leader_to(newIndex)

#called automatically whenever leaderIndex is changed, thanks to setget.
#changes the index variable, updates UI, any other logic anywhere else using signals.
func update_leader_to(newIndex):
	leaderIndex = newIndex
	Globals.portrait.set_texture(portraits[leaderIndex])
	#TODO: send a signal that we've switched to a specific character. 
	#TODO: camera should re-center as well 
	
func get_leader():
	return self.partyMembers[leaderIndex]

func get_leader_inkname():
	return get_leader().inkName

#TODO GET RID OF- TEMPORARY 
func get_partymember():
	return names[leaderIndex]
