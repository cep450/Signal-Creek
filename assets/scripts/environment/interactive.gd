extends Area2D

#for the INTERACT area collider of an interactive object

export var inkFileDream : Resource
export var inkFileReal : Resource

var canInteract = false #whether you can interact

func _process(_delta):
	if canInteract:
		if Input.is_action_just_pressed("interact"):
			if Gamevars.mode == "walk":
				Gamevars.mode = "talk"
				
				if Gamevars.plane == "dream" && inkFileDream:
					Gamevars.dialoguebox.load_story(inkFileDream)
					
				elif Gamevars.plane == "real" && inkFileReal:
					Gamevars.dialoguebox.load_story(inkFileReal)
					
				Gamevars.dialoguebox.panel.set_visible(true)

func _on_InteractArea_body_entered(body):
	if body.is_in_group("Player"):
		canInteract = true

func _on_InteractArea_body_exited(body):
	if body.is_in_group("Player"):
		canInteract = false
