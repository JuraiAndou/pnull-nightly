extends Control

func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene("res://src/Stage1.tscn")

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://src/Stage1.tscn")
