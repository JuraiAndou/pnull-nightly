extends KinematicBody2D

export var speed = 500
var lifes = 3
var retries = 3

var screen_size
signal up_kick_signal
onready var up_hit = get_node("Player_hit_up")

var player_input = null
var velocity = Vector2()

var LEFT = false
var RIGHT = false
var KICK = false

var current_state := 2
enum { WALK, KICK_UP, IDLE }


func _process(delta):
	_get_input()
	_set_animation()

#Animation handler
func _set_animation():
	if velocity.x > 0:
		$AnimatedSprite.flip_h = true
	elif velocity.x < 0:
		$AnimatedSprite.flip_h = false

	match current_state:
		WALK:
			$AnimatedSprite.play("Running")
		KICK_UP:
			$AnimatedSprite.play("Kicking")
		IDLE:
			$AnimatedSprite.play("idle")

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
	velocity.x = 0
	current_state = _check_idle_state()

func _walk_state(delta):
	velocity = Vector2.ZERO
	if LEFT:
		velocity.x -= 1
	if RIGHT:
		velocity.x += 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
	_move_and_collide(delta)
	current_state = _check_walk_state()

func _kick_up_state(delta):
	emit_signal("up_kick_signal")
	

func _check_idle_state():
	var _new_state = current_state
	if LEFT or RIGHT:
		_new_state = WALK
	elif KICK:
		_new_state = KICK_UP
	return _new_state

func _check_walk_state():
	var _new_state = current_state
	if (not LEFT) and (not RIGHT):
		_new_state = IDLE
	elif KICK:
		_new_state = KICK
	return _new_state

func _check_kick_state():
	var new_state = current_state
	return new_state

#moviment handler function
func _move_and_collide(delta):
	move_and_collide(velocity * delta)


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "Kicking":
		current_state = IDLE
