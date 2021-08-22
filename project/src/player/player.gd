extends KinematicBody2D

export var speed = 250
var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func input(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	
	moviment(delta, velocity)

func moviment(delta, velocity):
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
	move_and_slide(velocity)

func _process(delta):
	pass
	
func _physics_process(delta):
	input(delta)
