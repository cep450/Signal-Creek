tool
extends Node2D

export(StreamTexture) var dreamsheet
export(StreamTexture) var realsheet

onready var dreampos = self.get_global_position()
onready var realpos
export var realX: int
export var realY: int

export var inDream : bool = true
export var inReal : bool = true

func _ready():
	if !inReal:
		realpos = Vector2(-100, -100)
	else:
		realpos = dreampos + Vector2(realX, realY)
	if !inDream:
		dreampos = Vector2(-100, -100)
	if !Engine.editor_hint:
		self.set_global_position(dreampos)

func _process(_delta):
	if Engine.editor_hint:
		$Hint.visible = true
		$Hint.set_position(Vector2(realX, realY))
		$Hint.set_texture(realsheet)

func set_sheet(sheetId):
	$Sprite.set_texture(sheetId)
	
func set_pos(posId):
	self.set_global_position(posId)
	pass
