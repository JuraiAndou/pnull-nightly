extends Node2D

func _ready():
	$particulas.emitting = true
	$particulas_menores.emitting = true



func _process(delta):
	if not $particulas.emitting:
		queue_free()
	if not $particulas_menores.emitting:
		queue_free()
