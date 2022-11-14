extends Camera2D

#camera manager

export (NodePath) onready var following = get_node(following) #object to follow
export var lerpSpeed : int #camera smoothing speed

#pixel-scale boundaries for camera-accessible areas
export(Vector2) var camera_bounds_min
export(Vector2) var camera_bounds_max

#scale camera proportionally
export var window_scale : int = 3
onready var game_size := Vector2((OS.window_size / window_scale).x, (OS.window_size / window_scale).y)
onready var actual_cam_pos := global_position

#camera boundaries to match pixel-scale boundaries
onready var cam_min = Vector2(camera_bounds_min.x + game_size.x /2 + 1, camera_bounds_min.y + game_size.y /2 + 1)
onready var cam_max = Vector2(camera_bounds_max.x - game_size.x /2 -1, camera_bounds_max.y - game_size.y /2 - 1)

#camera fade-in transition variables
export onready var noFade : bool
onready var overlay = $ColorRect
var fadingIn = false

func _ready():
	Globals.camera = self
	if !noFade:
		fadingIn = true
		overlay.color.a = 1 #solid black



func _process(_delta):
	if fadingIn: #ok i know there's a way to make this more efficient but idk coroutines in godot
		yield(get_tree().create_timer(0.6), "timeout") #pause before fading in
		fadingIn = false
		if overlay.color.a > 0: #decrease overlay alpha to fade-in
			overlay.color.a -=.1

func pixel_perfect(delta):
	var cam_pos = Vector2(clamp(following.global_position.x, cam_min.x, cam_max.x), clamp(following.global_position.y, cam_min.y, cam_max.y))
	actual_cam_pos = lerp(actual_cam_pos, cam_pos, lerpSpeed * delta)
	var cam_subpixel_pos = actual_cam_pos.round() - actual_cam_pos
	global_position = actual_cam_pos.round()
	
	return cam_subpixel_pos

func rescale_camera(windowscale):
	window_scale = windowscale
	game_size = Vector2((OS.window_size / window_scale).x, (OS.window_size / window_scale).y)
	cam_min = Vector2(camera_bounds_min.x + game_size.x /2 + 1, camera_bounds_min.y + game_size.y /2 + 1)
	cam_max = Vector2(camera_bounds_max.x - game_size.x /2 -1, camera_bounds_max.y - game_size.y /2 - 1)
	
func set_camera_bounds(cameraboundsmin, cameraboundsmax):
	camera_bounds_min = cameraboundsmin
	camera_bounds_max = cameraboundsmax
	cam_min = Vector2(camera_bounds_min.x + game_size.x /2 + 1, camera_bounds_min.y + game_size.y /2 + 1)
	cam_max = Vector2(camera_bounds_max.x - game_size.x /2 -1, camera_bounds_max.y - game_size.y /2 - 1)

