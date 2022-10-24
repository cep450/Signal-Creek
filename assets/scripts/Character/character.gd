extends KinematicBody2D

#Individual character. 
#Can move.
#Updates sprites/animations accordingly.
#Has morale.

const maxMorale = 3
var morale = maxMorale

var inkName = "ERR NO NAME ASSIGNED"

var velocity : Vector2 = Vector2()
var direction : Vector2 = Vector2()
export var speed : float

onready var animPlayer = $AnimationPlayer
var idle : String = "DownIdle"


func _physics_process(_delta):
	if Globals.mode == Enums.Mode.WALK:
		read_input()
		
		animPlayer.play(idle)

func animate_up():
	animPlayer.play("Up")
	idle = "UpIdle"

func animate_down():
	animPlayer.play("Down")
	idle = "DownIdle"

func animate_left():
	animPlayer.play("Left")
	idle = "LeftIdle"

func animate_right():
	animPlayer.play("Right")
	idle = "RightIdle"

func animate_idle():
	animPlayer.play(idle);

#func move(directionVector : Vector2):
	#directionVector should be normalized
	#multiply by delta and speed
	#call the correct movement animation based on angle 
	#pass

func read_input():
	velocity = Vector2()
	
	if Input.is_action_pressed("ui_up"):
		velocity.y -= speed
		direction = Vector2(0, -1)
		
		animPlayer.play("Up")
		idle = "UpIdle"
		
	elif Input.is_action_pressed("ui_down"):
		velocity.y += speed
		direction = Vector2(0, 1)
		animPlayer.play("Down")
		idle = "DownIdle"
	
	elif Input.is_action_pressed("ui_left"):
		velocity.x -= speed
		direction = Vector2(-1, 0)
		animPlayer.play("Left")
		idle = "LeftIdle"
		
	elif Input.is_action_pressed("ui_right"):
		velocity.x += speed
		direction = Vector2(1, 0)

		animPlayer.play("Right")
		idle = "RightIdle"
	else:
		animPlayer.play(idle);
		pass
		
	velocity = velocity.normalized()
	velocity = move_and_slide(velocity * 100)

func gain_morale():
	morale = max(morale + 1, maxMorale)
	#TODO any related sounds, sprites, ui changes, ect 

func lose_morale():
	morale = morale - 1
	#TODO any related sounds, ui changes, ect 
	if morale <= 0:
		morale_depleted()

func morale_depleted():
	morale = 0
	#TODO any related sounds, ui changes, ect
	#TODO related game logic 
