extends Node2D

func _on_Menu_play_sound(som):
	match som:
		'menu':
			$Menu/theme.play()
		'accept':
			$Menu/accept.play()
		'move':
			$Menu/move.play()


func _on_Ball_play_sound(som):
	match som:
		"bounce":
			$Bola/quique.play()
		"kick":
			$Bola/chute.play()
		

func _on_World_play_sound():
	$Stages/Stage1.play()


func _on_Player_play_sound(som):
	match som:
		"hit":
			$Bola/hit.play()
