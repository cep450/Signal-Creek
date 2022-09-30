extends MarginContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func remove_placeholders():
	var placeholders = $VBoxContainer/DialogueTextContainer/Background/VBoxContainer.get_children()
	for placeholder in placeholders:
		$VBoxContainer/DialogueTextContainer/Background/VBoxContainer.remove_child(placeholder)
	pass # Replace with function body.

	
func add_choice_child(newNode):
	$VBoxContainer/DialogueTextContainer/Background/VBoxContainer.add_child(newNode)

func get_choices():
	return $VBoxContainer/DialogueTextContainer/Background/VBoxContainer.get_children()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
