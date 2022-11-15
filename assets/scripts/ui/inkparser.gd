extends Control

#InkParser parses ink passages and interfaces with the ink player
#note, choices will be referred to as "Diverts" (what ink calls them)

onready var background_panel_node = $Panel
onready var scroll_node = $Panel/MarginContainer/ScrollContainer
onready var vertical_layout_node = $Panel/MarginContainer/ScrollContainer/VBoxContainer
onready var player = $InkPlayer
onready var audioPlayer = $AudioStreamPlayer

var TextEntry = preload("res://assets/ui/prefabs/dialogueBox_entry.tscn")
var DialogueEntry = preload("res://assets/ui/prefabs/dialogueBox_entryDialogue.tscn")
var ChoiceEntry = preload("res://assets/ui/prefabs/dialogueBox_entryChoices.tscn")
var Divert = preload("res://assets/ui/prefabs/dialogueBox_entryChoices_Divert.tscn")

export var choiceSelectSound : AudioStreamSample #scroll_nodeing through choices
export var ChoiceEntrySound : AudioStreamSample #when a new choice entry appears
export var newEntrySound : AudioStreamSample #when a new entry or dialogue entry appears

export var talk : bool #for isolated testing purposes; default to false for full game

#DIALOGUE ENTRY VARS
var currentName = "THE PARTY" #stores the current name to put into entry nametags
onready var color_manager = $ColorManager #for name colors
#var currentColor = Color(1, 1, 1)

#CHOICE ENTRY VARS
var currentChoiceStrings
var isDisplayingChoices
var currentlyHighlightedChoice = 0
var currentlyHighlightedChoiceEntry
var currentChoiceEntryDiverts

#InkLinker links ink with C# and gdscript functions 
var inkLinker = preload("res://assets/scripts/InkLinker.cs")


func _ready():
	
	delete_children(vertical_layout_node)
	background_panel_node.set_visible(false)
	player.LoadStory()

	#load variable values from external storage
	inkLinker.SetVariableValues(player);

	#bind custom external functions between ink and C#
	inkLinker.BindExternalFunctions(player);

	if talk:
		Globals.mode = Enums.Mode.TALK


func _process(_delta):
	
	if Globals.mode == Enums.Mode.TALK:
		if isDisplayingChoices:
			if Input.is_action_just_released("ui_down"):
				
				currentChoiceEntryDiverts[currentlyHighlightedChoice].set_highlighted(false)
				currentlyHighlightedChoice += 1
				
				if currentlyHighlightedChoice >= currentChoiceStrings.size():
					currentlyHighlightedChoice = 0
					
				currentChoiceEntryDiverts[currentlyHighlightedChoice].set_highlighted(true)
				
				play_sound(choiceSelectSound)
				
			if Input.is_action_just_released("ui_up"):
				
				currentChoiceEntryDiverts[currentlyHighlightedChoice].set_highlighted(false)
				currentlyHighlightedChoice -= 1
				
				if currentlyHighlightedChoice < 0:
					currentlyHighlightedChoice = currentChoiceStrings.size() - 1
					
				currentChoiceEntryDiverts[currentlyHighlightedChoice].set_highlighted(true)
				
				play_sound(choiceSelectSound)
			
			if Input.is_action_just_pressed("interact"): #Divert is submitted
				vertical_layout_node.remove_child(currentlyHighlightedChoiceEntry) #remove the choicebox
				
				if currentlyHighlightedChoice < 0:
					currentlyHighlightedChoice = 0
				
				player.ChooseChoiceIndex(currentlyHighlightedChoice)
				_proceed()
		
		elif Input.is_action_just_pressed("interact"):
			_proceed()



func _proceed():
	
	if !player.get_CanContinue() && !player.get_HasChoices():
		clear_and_reset()
		
	elif !player.get_HasChoices(): #create normal text entry
		player.Continue()
		
		var currentLine = player.get_CurrentText() #get current text from ink player
		
		if currentLine.substr(0, 1) == "&":
			Globals.planeManager.shiftPlane()
			currentLine = currentLine.trim_prefix('&')
			
		if currentLine.substr(0, 1) == ":": #this is a name for the choice entry nametag; not an entry to put in
			print("checked")
			set_current_name(currentLine.substr(1).strip_escapes())
			displayChoices()
		
		elif ":" in currentLine: #if line contains a name, parse name and dialogue after
			set_current_name(currentLine.split(":", false)[0] + ":")
			create_entry_dialogue(currentLine.split(":", false)[1].strip_escapes().trim_prefix(' '))
		
		else: #if line doesn't contain name, it's a normal text entry
			create_entry(currentLine.strip_escapes())
		
	elif !isDisplayingChoices: #create entry with choices
		displayChoices()
		
	#scroll_node to bottom when new message appears (make this tween later)
	yield(get_tree(), "idle_frame")
	scroll_node.set_v_scroll(scroll_node.get_v_scrollbar().max_value)


func displayChoices():
	
	player.SetVariable("currentPartyChar", Globals.party.get_leader_inkname())
	currentChoiceStrings = player.get_CurrentChoices() #get current choices from ink
	
	create_entry_choices(currentChoiceStrings)
	isDisplayingChoices = true
	
	currentlyHighlightedChoice = 0
	currentChoiceEntryDiverts[currentlyHighlightedChoice].set_highlighted(true)


func create_entry(text):
	
	var newEntry = TextEntry.instance()
	vertical_layout_node.add_child(newEntry)
	
	newEntry.text = text
	isDisplayingChoices = false
	
	play_sound(newEntrySound)


func create_entry_dialogue(newtext):
	
	var newDialogueEntry = DialogueEntry.instance()
	vertical_layout_node.add_child(newDialogueEntry)

	newDialogueEntry.set_nametag(currentName, color_manager.get_current_color())
	newDialogueEntry.remove_placeholders()
	
	var newParagraph = TextEntry.instance()
	newParagraph.text = newtext
	newDialogueEntry.set_dialogue(newParagraph)
	
	isDisplayingChoices = false
	
	play_sound(newEntrySound)


func create_entry_choices(choices):
	
	var newChoiceEntry = ChoiceEntry.instance()
	vertical_layout_node.add_child(newChoiceEntry)
	
	newChoiceEntry.remove_placeholders()
	
	
	newChoiceEntry.set_nametag(currentName, color_manager.get_current_color())
	
	for option in choices: #iterate through choices, add nodes as children
		var newDivert = Divert.instance()
		
		var newText
		
		if ":" in option:
			var nameSubstring = option.split(":", false)[0].strip_escapes()
			var colorCode = color_manager.get_current_color()

			var textSubstring = option.split(":", false)[1].strip_escapes()
			
			newText = '[color=#' + colorCode.to_html() + '][b]' + nameSubstring + ':[/b][/color]' + textSubstring 
			
		else:
			newText = '[' + option + ']'
		
		newDivert.set_choice_text(newText)
		newChoiceEntry.add_choice_child(newDivert)
		
	currentlyHighlightedChoiceEntry = newChoiceEntry
	currentChoiceEntryDiverts = newChoiceEntry.get_choices()
	
	play_sound(ChoiceEntrySound)


static func delete_children(node):
	
	for n in node.get_children():
		node.remove_child(n)
		n.queue_free()


func clear_and_reset():
	#unsure if these two apply universally; they refer to the ink player itself
	#player.Reset()
	player.LoadStory()
	
	background_panel_node.set_visible(false)
	delete_children(vertical_layout_node)
	Globals.mode = Enums.Mode.WALK


func play_sound(soundName):
	
	audioPlayer.stream = soundName
	audioPlayer.play()


func set_current_name(source):
	
	currentName = source
	color_manager.set_current_color(source)


func load_story(inkFile):
	
	player.LoadStory(inkFile)
	print("Current Party Leader: " + Globals.party.get_leader_inkname())
	print("Ink Player is Running")
	player.SetVariable("currentPartyChar", Globals.party.get_leader_inkname())
