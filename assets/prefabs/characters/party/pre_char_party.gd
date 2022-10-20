extends YSort

var partyMembers = ["NICK", "NOUR", "MS SUWAN"]
export(Array, Texture) var portraits = []

var currentIndex = 0 #an int

var partymember = partyMembers[currentIndex]

func _ready():
	pass

func _process(_delta):
	if Input.is_action_just_pressed("switch_character"):
		currentIndex += 1
		if currentIndex > 2:
			currentIndex = 0
		set_partymember(currentIndex)
	pass

func set_partymember(charIndex):
	self.currentIndex = charIndex
	Gamevars.portrait.set_texture(portraits[currentIndex])
	
func get_partymember():
	return self.partyMembers[currentIndex]
