extends MarginContainer

func remove_placeholders():
	var placeholders = $VBoxContainer/DialogueTextContainer/Background/VBoxContainer.get_children()
	for placeholder in placeholders:
		$VBoxContainer/DialogueTextContainer/Background/VBoxContainer.remove_child(placeholder)

func set_nametag(newname):
	$VBoxContainer/Name.text = newname

func set_dialogue(dialoguetext):
	$VBoxContainer/DialogueTextContainer/Background/VBoxContainer.add_child(dialoguetext)
