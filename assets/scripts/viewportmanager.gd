extends AspectRatioContainer




func _process(_delta):
	set_container_size()


func set_container_size():
	set_scale(Vector2(OS.window_size.x/camWidth, OS.window_size.y/camHeight))
	#$Viewport.set_size(Vector2(camWidth + 2, camHeight + 2))
	#$UserInterface/ReferenceRect.set_scale(Vector2(OS.window_size.x/(camWidth*3), OS.window_size.y/(camHeight*3)))
	#$UserInterface.set_size(Vector2(camWidth, camHeight))

