extends KinematicBody2D

export var speed = 250
var screen_size
signal up_kick_signal
onready var up_hit = get_node("Player_hit_up")

var player_input = null

var velocity = Vector2()

var LEFT = false
var RIGHT = false
var KICK = false

var current_state := 3
enum { WALK, KICK_UP, IDLE }

func _process(delta):
	_get_input()

#input handler funciton
func _get_input():
	LEFT = false
	RIGHT = false
	KICK = false
	if(Input.is_action_pressed("ui_left")):
		LEFT = true
	if(Input.is_action_pressed("ui_right")):
		RIGHT = true
	if(Input.is_action_pressed("ui_kick")):
		KICK = true
	
func _physics_process(delta):
	match current_state:
		WALK:
			_walk_state(delta)
		KICK_UP:
			_kick_up_state(delta)
		IDLE:
			_idle_state()
		

func _idle_state():
	print("idle")
	velocity.x = 0

func _walk_state(delta):
	if LEFT:
		velocity.x -= 1
	if RIGHT:
		velocity.x += 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
	_move_and_collide(delta)

func _kick_up_state(delta):
	if KICK:
		print("kicking")
	pass

#moviment handler function
func _move_and_collide(delta):
	move_and_collide(velocity * delta)

#func _ready():
#	screen_size = get_viewport_rect().size
#
#func input(delta):
#	var velocity = Vector2.ZERO
#	if Input.is_action_pressed("ui_right"):
#		velocity.x += 1
#	if Input.is_action_pressed("ui_left"):
#		velocity.x -= 1
#
#	moviment(delta, velocity)
#
#func moviment(delta, velocity):
#	if velocity.length() > 0:
#		velocity = velocity.normalized() * speed
#
#	move_and_collide(velocity * delta)
#
#func _process(delta):
#	pass
#
#func _physics_process(delta):
#	input(delta)
#
#
#func _on_Player_hit_up_body_shape_entered(body_id, body, body_shape, local_shape):
#	print(body.name)
#	if(body.name == "Ball"):
#		emit_signal("mySignal")




func _on_Player_hit_up_body_shape_entered(body_id, body, body_shape, local_shape):
	pass # Replace with function body.
