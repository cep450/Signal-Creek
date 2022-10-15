extends Area2D

#abstract for object you can interact with

var canIntr = false #whether you can interact
export var inkFile : Resource

func _process(_delta):
	if canIntr:
		if Input.is_action_just_pressed("interact"):
			if Gamevars.mode == "walk":
				Gamevars.mode = "talk"
				if inkFile:
					Gamevars.dialoguebox.load_story(inkFile)
				Gamevars.dialoguebox.panel.set_visible(true)
				print("interacting")
			pass

func _on_InteractArea_body_entered(body):
	if body.is_in_group("Player"):
		canIntr = true
	pass

func _on_InteractArea_body_exited(body):
	if body.is_in_group("Player"):
		canIntr = false
	pass
