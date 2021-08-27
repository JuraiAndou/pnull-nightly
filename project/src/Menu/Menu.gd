extends Node2D

var itemSelected

func _ready():
	itemSelected = 0

func get_inputs():
	if Input.is_action_just_pressed("ui_right"):
		itemSelected +=1
	elif Input.is_action_just_pressed("ui_left"):
		itemSelected -=1
	elif Input.is_action_just_pressed("ui_accept"):
		match itemSelected:
			0:
				get_tree().change_scene("res://src/World.tscn")
			1:
				print ("ainda n tem tela de controles :p")
			2:
				get_tree().quit()
				
func pointer_moviment():
	$pointer.global_position = $Options.get_child(itemSelected).global_position - Vector2(15,-35)
	
func _process(delta):
	get_inputs()
		
func _physics_process(delta):
	
	if itemSelected < 0:
		itemSelected = $Options.get_child_count() - 1
	if itemSelected > $Options.get_child_count() - 1:
		itemSelected = 0
		
	pointer_moviment()
	