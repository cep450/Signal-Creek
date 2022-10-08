extends MarginContainer

func remove_placeholders():
	var placeholders = $VBoxContainer/DialogueTextContainer/Background/VBoxContainer.get_children()
	for placeholder in placeholders:
		$VBoxContainer/DialogueTextContainer/Background/VBoxContainer.remove_child(placeholder)

	
func add_choice_child(newNode):
	$VBoxContainer/DialogueTextContainer/Background/VBoxContainer.add_child(newNode)

func get_choices():
	return $VBoxContainer/DialogueTextContainer/Background/VBoxContainer.get_children()
	
func set_nametag(newname, color):
	$VBoxContainer/Name.bbcode_text = '[b]' + newname + '[/b]'
	$VBoxContainer/Name.set("custom_colors/default_color", color)
	#$VBoxContainer/DialogueTextContainer/Background.set("custom_styles/panel/border_color", Color(1, 0, 0, 1))
