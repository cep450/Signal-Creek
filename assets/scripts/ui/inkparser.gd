extends Control

#InkParser parses ink passages and interfaces with the ink player
#note, choices will be referred to as "diverts" (what ink calls them)

onready var panel = $Panel #background panel that conains all dialoguebox nodes
onready var scroll = $Panel/MarginContainer/ScrollContainer #scrollbox containing vertical layout box
onready var vbox = $Panel/MarginContainer/ScrollContainer/VBoxContainer #vertical layout containing entries
onready var player = $InkPlayer #ink player; interfaces with ink runtime
onready var audioPlayer = $AudioStreamPlayer #audio player

#preload prefab resources
var textEntry = preload("res://assets/ui/prefabs/dialoguebox_entry.tscn")
var dialogueEntry = preload("res://assets/ui/prefabs/dialoguebox_entry_dialogue.tscn")
var choiceEntry = preload("res://assets/ui/prefabs/dialoguebox_entry_choice.tscn")
var divert = preload("res://assets/ui/prefabs/dialoguebox_entry_choice_divert.tscn")

#sounds
export var choiceSelectSound : AudioStreamSample #scrolling through choices
export var choiceEntrySound : AudioStreamSample #when a new choice entry appears
export var newEntrySound : AudioStreamSample #when a new entry or dialogue entry appears

export var talk : bool #for isolated testing purposes; default to false for full game

#DIALOGUE ENTRY VARS
var currentName = "THE PARTY" #stores the current name to put into entry nametags
var currentColor = Color(1, 1, 1)

#CHOICE ENTRY VARS
var choiceArray #array of strings representing current diverts
var displayingChoices #whether we're in choice mode
var currentDivert = 0 #index of selected choice in choice array
var currentDivertEntry #currently displaying node of choice buttons
var currentChoiceEntryDiverts #current choice buttons

#InkLinker links ink with C# and gdscript functions 
var inkLinker = preload("res://assets/scripts/InkLinker.cs")


func _ready():
	delete_children(vbox) #delete placeholders
	panel.set_visible(false) #hide for now
	player.LoadStory() #tell ink player to load story resource

	#load variable values from external storage
	inkLinker.SetVariableValues(player);

	#bind custom external functions between ink and C#
	inkLinker.BindExternalFunctions(player);

	if talk:
		Gamevars.mode = "talk"

func _process(_delta):
	if Gamevars.mode == "talk":
		if displayingChoices:
			if Input.is_action_just_released("ui_down"): #going through choices
				
				#this block is for highlighting the selected choice
				currentChoiceEntryDiverts[currentDivert].set_highlighted(false)
				currentDivert += 1
				
				if currentDivert >= choiceArray.size():
					currentDivert = 0
					
				currentChoiceEntryDiverts[currentDivert].set_highlighted(true)
				
				play_sound(choiceSelectSound)
			if Input.is_action_just_released("ui_up"): #going through choices
				
				#this block is for highlighting the selected choice
				currentChoiceEntryDiverts[currentDivert].set_highlighted(false)
				currentDivert -= 1
				
				if currentDivert < 0:
					currentDivert = choiceArray.size() - 1
					
				currentChoiceEntryDiverts[currentDivert].set_highlighted(true)
				
				play_sound(choiceSelectSound)
			
			if Input.is_action_just_pressed("interact"): #divert is submitted
				vbox.remove_child(currentDivertEntry) #remove the choicebox
				
				if currentDivert < 0:
					currentDivert = 0
				
				player.ChooseChoiceIndex(currentDivert) #notify ink player of selected choice
				_proceed() #progress the ink player
		
		elif Input.is_action_just_pressed("interact"):
			_proceed() #tell ink player to proceed to next passage

#progress the ink player
func _proceed():
	if !player.get_CanContinue() && !player.get_HasChoices(): #end of conversation; close everything
		clear_and_reset()
		
	elif !player.get_HasChoices(): #create normal text entry
		player.Continue() #progress ink player to next text
		
		var currentLine = player.get_CurrentText() #get current text from ink player
		
		if currentLine.substr(0, 1) == "&":
			Gamevars.planeManager.shiftPlane()
			currentLine = currentLine.trim_prefix('&')
			
		if currentLine.substr(0, 1) == ":": #this is a name for the choice entry nametag; not an entry to put in
			print("checked")
			set_current_name(currentLine.substr(1).strip_escapes())
			displayChoices()
		
		elif ":" in currentLine: #if line contains a name, parse name and dialogue after
			set_current_name(currentLine.split(":", false)[0] + ":")
			create_dialogueEntry(currentLine.split(":", false)[1].strip_escapes().trim_prefix(' '))
		
		else: #if line doesn't contain name, it's a normal text entry
			create_entry(currentLine.strip_escapes())
		
	elif !displayingChoices: #create entry with choices
		displayChoices()
		
	#scroll to bottom when new message appears (make this tween later)
	yield(get_tree(), "idle_frame")
	scroll.set_v_scroll(scroll.get_v_scrollbar().max_value)

func displayChoices():
	player.SetVariable("currentPartyChar", Gamevars.party.get_partymember())
	choiceArray = player.get_CurrentChoices() #get current choices from ink
	
	create_choiceEntry(choiceArray)
	displayingChoices = true
	
	currentDivert = 0
	currentChoiceEntryDiverts[currentDivert].set_highlighted(true)
	
#create normal text entry
func create_entry(text):
	var newEntry = textEntry.instance()
	vbox.add_child(newEntry)
	
	newEntry.text = text
	displayingChoices = false
	
	play_sound(newEntrySound)
	
#create dialogue text entry w/ character name	
func create_dialogueEntry(newtext):
	var newDialogueEntry = dialogueEntry.instance()
	vbox.add_child(newDialogueEntry)

	newDialogueEntry.set_nametag(currentName, currentColor)
	newDialogueEntry.remove_placeholders()
	
	var newParagraph = textEntry.instance()
	newParagraph.text = newtext
	newDialogueEntry.set_dialogue(newParagraph)
	
	displayingChoices = false
	
	play_sound(newEntrySound)

#create entry with choices
func create_choiceEntry(choices):
	var newchoiceEntry = choiceEntry.instance()
	vbox.add_child(newchoiceEntry)
	
	newchoiceEntry.remove_placeholders()
	newchoiceEntry.set_nametag(currentName, currentColor)
	
	for option in choices: #iterate through choices, add nodes as children
		var newDivert = divert.instance()
		
		var newText
		
		if ":" in option:
			var nameSubstring = option.split(":", false)[0].strip_escapes()
			var colorCode = $ColorManager.characterColors.get(nameSubstring.to_lower().trim_suffix(":"))
			#[color=<code/name>]
			#$ColorManager.characterColors.get(currentName.to_lower().trim_suffix(":"))
			var textSubstring = option.split(":", false)[1].strip_escapes()
			
			newText = '[color=#' + colorCode.to_html() + '][b]' + nameSubstring + ':[/b][/color]' + textSubstring 
		else:
			newText = '[' + option + ']'
		
		newDivert.set_choice_text(newText)
		newchoiceEntry.add_choice_child(newDivert)
		
	currentDivertEntry = newchoiceEntry
	currentChoiceEntryDiverts = newchoiceEntry.get_choices()
	
	play_sound(choiceEntrySound)

static func delete_children(node):
	for n in node.get_children():
		node.remove_child(n)
		n.queue_free()

#for when the conversation has ended; reset everything.
func clear_and_reset():
	#unsure if these two apply universally; they refer to the ink player itself
	player.Reset()
	player.LoadStory()
	
	#keep these, they're specific to the UI nodes
	panel.set_visible(false)
	delete_children(vbox)
	Gamevars.mode = "walk"

#play sound (doesn't loop)
func play_sound(soundName):
	audioPlayer.stream = soundName
	audioPlayer.play()

#store a name to add to nametag; also determines stylebox colors
func set_current_name(source):
	currentName = source
	currentColor = $ColorManager.characterColors.get(currentName.to_lower().trim_suffix(":"))
	pass

func load_story(inkFile):
	player.LoadStory(inkFile)
	print(Gamevars.party.get_partymember())
	print("running")
	player.SetVariable("currentPartyChar", Gamevars.party.get_partymember())
