
extends Node

# in walk mode dialogue box not interactable, in talk mode can't move around 
#enum Mode {
#	walk, talk
#}

#declare global game variables
onready var player = null
onready var mode = "walk"
onready var dream = true
onready var dialoguebox = null

#data that needs to be saved between scenes 
#maybe a game data resource 

#TODO make Party an autoload. keep data between all scenes. 
#probably also want references to the chars in the party- or just get thru party?
#same with NarrativeData

