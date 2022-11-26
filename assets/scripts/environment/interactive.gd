extends Area2D

#for the INTERACT area collider of an interactive object

#export var inkFileDream : Resource
#export var inkFileReal : Resource

var canInteract = false

export var interactiveByNick = false
export var interactiveByNour = false 
export var interactiveBySuwan = false

signal can_interact
signal cannot_interact


func _process(_delta):
	
	if canInteract:
		
		if Input.is_action_just_pressed("interact"):
			
			if Globals.mode == Globals.GameModes.WALK:
				
				Globals.mode = Globals.GameModes.TALK
				
				Globals.dialogueBox.open(get_object_name()) #tell inkparser to go to a knot based on this object's name
					
				Globals.dialogueBox.background_panel_node.set_visible(true)


func _on_InteractArea_body_entered(body):
	
	if body.is_in_group("Player") && body == Globals.party.get_leader():
		
		var currentLeader = Globals.party.leaderIndex
		
		if currentLeader == 0 && interactiveByNick:
			canInteract = true
			emit_signal("can_interact")
			
		elif currentLeader == 1 && interactiveByNour:
			canInteract = true
			emit_signal("can_interact")
			
		elif currentLeader == 2 && interactiveBySuwan:
			canInteract = true
			emit_signal("can_interact")
			



func _on_InteractArea_body_exited(body):
	
	if body.is_in_group("Player"):
		
		canInteract = false
		emit_signal("cannot_interact")

#recieves signals on character switch 
#ex. when we switch to nour, show a nour can interact outline 

#return name of this object as it is stated in the prefab file name, excluding obj_ prefix
func get_object_name():
	var rawfilename = self.get_parent().filename
	print(rawfilename.right(rawfilename.find_last("/") + 1).trim_suffix(".tscn").trim_prefix("obj_"))
	return rawfilename.right(rawfilename.find_last("/") + 1).trim_suffix(".tscn").trim_prefix("obj_")
	
