extends Area2D

#for the INTERACT area collider of an interactive object

export var inkFileDream : Resource
export var inkFileReal : Resource

var canInteract = false #whether you can interact

#who sees this as interactable?
var interactiveByNick = false
var interactiveByNour = false 
var interactiveBySuwan = false

signal can_interact
signal cannot_interact

func _process(_delta):
	if canInteract:
		if Input.is_action_just_pressed("interact"):
			if Globals.mode == Enums.Mode.WALK:
				Globals.mode = Enums.Mode.TALK
				
				if Globals.world == Enums.Pln.DREAM && inkFileDream:
					Globals.dialoguebox.load_story(inkFileDream)
					
				elif Globals.world == Enums.Pln.REAL && inkFileReal:
					Globals.dialoguebox.load_story(inkFileReal)
					
				Globals.dialoguebox.panel.set_visible(true)

func _on_InteractArea_body_entered(body):
	if body.is_in_group("Player"):
		canInteract = true
		emit_signal("can_interact")

func _on_InteractArea_body_exited(body):
	if body.is_in_group("Player"):
		canInteract = false
		emit_signal("cannot_interact")

#recieves signals on character switch 
#ex. when we switch to nour, show a nour can interact outline 
