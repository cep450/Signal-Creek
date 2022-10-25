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
		$Hint.visible = false

func _process(_delta):
	if Engine.editor_hint:
		set_hint_attributes()

func set_sheet(sheetId):
	$Sprite.set_texture(sheetId)
	
func set_pos(posId):
	self.set_global_position(posId)
	pass

func set_hint_attributes():
	$Hint.region_rect = $Sprite.region_rect
	$Hint.set_position(Vector2(realX, realY))
	$Hint.set_texture(realsheet)
	$Hint.offset.y = $Sprite.region_rect.size.y / -2


func _on_ActiveArea_can_interact():
	pass # Replace with function body.


func _on_ActiveArea_cannot_interact():
	pass # Replace with function body.
