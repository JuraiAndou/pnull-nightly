extends Node

signal play_sound()
signal game_end

func _ready():
	emit_signal("play_sound")
	get_tree().paused = false


func _on_Player_death():
	get_tree().change_scene("res://src/Telas finais/GameOver.tscn")


func _on_Ball_stop():
	get_tree().change_scene("res://src/Telas finais/GameOver.tscn")

func _physics_process(delta):
	if $Inimigos/Linha1.get_child_count() < 1  and $Inimigos/Linha2.get_child_count() < 1 and $Inimigos/Linha3.get_child_count() < 1:
		emit_signal("game_end")
		get_tree().paused = true
	 
