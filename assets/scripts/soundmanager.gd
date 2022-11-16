extends Node

#audio manager; accessed globally, plays all sounds

onready var audioPlayer = $AudioStreamPlayer2D

export var choice_select_sound : AudioStreamSample #scroll_nodeing through choices
export var new_choice_entry_sound : AudioStreamSample #when a new choice entry appears
export var new_entry_sound : AudioStreamSample #when a new entry or dialogue entry appears

func play_sound(soundName):
	
	audioPlayer.stream = soundName
	audioPlayer.play()
