extends Area2D

const LAZER = preload("res://src/Inimigo/Laser.tscn")

func _process(delta):
	
	pass


func _on_Inimigo_body_entered(body):
	#Verifica colisão com a bola
	if body.name == "Ball":
		#cria a lança o tiro
		var lazer = LAZER.instance()
		get_parent().add_child(lazer)
		lazer.global_position = global_position
		queue_free()
