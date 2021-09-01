extends Node2D

var spd = 300

var tela

func _ready():
	tela = get_viewport_rect().size
	
func _process(delta):
	#destroi o node ao passar do limite da tela
	if global_position.y > tela.y:
		queue_free()

func _physics_process(delta):
	#movimenta o tiro
	translate(Vector2(0,1) * spd * delta)
	
func _on_Laser_body_entered(body):
	if body.name == "Player":
		get_tree().call_group("player", "set_hit")
		queue_free()
