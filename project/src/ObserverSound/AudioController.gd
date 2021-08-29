extends Node2D

func _on_Menu_play_sound(som):
	match som:
		'menu':
			$menu_theme.play()
		'accept':
			$menu_accept.play()
		'move':
			$menu_move.play()
