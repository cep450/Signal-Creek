extends Control

#InkParser parses ink passages and interfaces with the ink player
#note, choices will be referred to as "diverts" (what ink calls them)

onready var panel = $Panel #background panel that conains all dialoguebox nodes
onready var scroll = $Panel/MarginContainer/ScrollContainer #scrollbox containing vertical layout box
onready var vbox = $Panel/MarginContainer/ScrollContainer/VBoxContainer #vertical layout containing entries
onready var player = $InkPlayer #ink player; interfaces with ink runtime

#preload prefab resources
var textEntry = preload("res://assets/ui/prefabs_ui/pre_ui_dialoguebox_entry.tscn")
var dialogueEntry = preload("res://assets/ui/prefabs_ui/pre_ui_dialoguebox_entry_dialogue.tscn")
var choiceEntry = preload("res://assets/ui/prefabs_ui/pre_ui_dialoguebox_entry_choice.tscn")
var divert = preload("res://assets/ui/prefabs_ui/pre_ui_dialoguebox_entry_choice_divert.tscn")

export var talk : bool #for isolated testing purposes; default to false for full game

#DIALOGUE ENTRY VARS
var currentName = "THE PARTY" #stores the current name to put into entry nametags
var currentDialogueEntry

#CHOICE ENTRY VARS
var choiceArray #array of strings representing current diverts
var displayingChoices #whether we're in choice mode
var currentDivert = 0 #index of selected choice in choice array
var currentDivertEntry #currently displaying node of choice buttons
var currentChoiceEntryDiverts #current choice buttons

func _ready():
	delete_children(vbox)
	panel.set_visible(false)
	player.LoadStory()
	if talk:
		Gamevars.mode = "talk"

func _process(_delta):
	if Gamevars.mode == "talk":
		if displayingChoices:
			if Input.is_action_just_released("choice_select_down"): #going through choices
				
				#this block is for highlighting the selected choice
				currentChoiceEntryDiverts[currentDivert].set_highlighted(false)
				currentDivert += 1
				if currentDivert >= choiceArray.size():
					currentDivert = 0
				currentChoiceEntryDiverts[currentDivert].set_highlighted(true)
			
			if Input.is_action_just_pressed("interact"): #divert is submitted
				vbox.remove_child(currentDivertEntry)
				#create_entry(choiceArray[currentDivert])
				
				if currentDivert < 0:
					currentDivert = 0
				player.ChooseChoiceIndex(currentDivert)
				
				_proceed()
		
		elif Input.is_action_just_pressed("interact"):
			_proceed()

#progress the ink player
func _proceed():
	if !player.get_CanContinue() && !player.get_HasChoices(): #end of conversation
		clear_and_reset()
	elif !player.get_HasChoices(): #create normal text entry
		player.Continue() #progress ink player to next text
		var currentLine = player.get_CurrentText() #get current text from ink player
		
		if currentLine[0] == ":": #this is a name for the choice entry nametag; not an entry to put in
			currentName = currentLine
			player.Continue()
		
		elif ":" in currentLine: #if line contains a name, parse name and dialogue after
			create_dialogueEntry(currentLine.split(":", false)[0], currentLine.split(":", false)[1])
		
		else: #if line doesn't contain name, it's a normal text entry
			create_entry(currentLine)
		
	elif !displayingChoices: #create entry with choices
		choiceArray = player.get_CurrentChoices()
		create_choiceEntry(currentName, choiceArray)
		displayingChoices = true
		currentDivert = -1
		
	#scroll to bottom when new message appears (make this tween later)
	yield(get_tree(), "idle_frame")
	scroll.set_v_scroll(scroll.get_v_scrollbar().max_value)

#create normal text entry
func create_entry(text):
	var newEntry = textEntry.instance()
	vbox.add_child(newEntry)
	newEntry.text = text
	displayingChoices = false
	
func create_dialogueEntry(newname, text):
	var newDialogueEntry = dialogueEntry.instance()
	vbox.add_child(newDialogueEntry)
	currentDialogueEntry = newDialogueEntry
	newDialogueEntry.set_nametag(newname)
	

#create entry with choices
func create_choiceEntry(newname, choices):
	var newchoiceEntry = choiceEntry.instance()
	newchoiceEntry.remove_placeholders()
	newchoiceEntry.set_nametag(newname)
	for option in choices:
		var newDivert = divert.instance()
		newDivert.set_choice_text(option)
		newchoiceEntry.add_choice_child(newDivert)
		
	vbox.add_child(newchoiceEntry)
	currentDivertEntry = newchoiceEntry
	currentChoiceEntryDiverts = newchoiceEntry.get_choices()

static func delete_children(node):
	for n in node.get_children():
		node.remove_child(n)
		n.queue_free()

func clear_and_reset(): #for when the conversation has ended; reset everything
	panel.set_visible(false)
	player.Reset()
	player.LoadStory()
	delete_children(vbox)
	Gamevars.mode = "walk"
