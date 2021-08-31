extends Area2D

#precarrega o sprite do tiro para evitar pop-ups
const LAZER = preload("res://src/Inimigo/Laser.tscn")
const EXPLOSION = preload ("res://src/Inimigo/explosão.tscn")

var score = 200

func _on_Inimigo_body_entered(body):
	#Verifica colisão com a bola
	if body.name == "Ball":
		#cria a lança o tiro
		var lazer = LAZER.instance()
		get_parent().add_child(lazer)
		lazer.global_position = global_position
		
		#cria a animação de exploção
		var explosion = EXPLOSION.instance()
		get_parent().add_child(explosion)
		explosion.global_position = global_position
		
		#destroi a intancia do inimigo
		queue_free()
		
		#pontuação
		get_tree().call_group("HUD", "inimigo_destruido", score)

		
