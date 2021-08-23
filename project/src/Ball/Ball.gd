extends KinematicBody2D

var mov = Vector2(1,-1)
var spd = 300
var maxHeight = 200
var tela
var upKick = false

func _ready():
	tela = get_viewport_rect().size
	
func _physics_process(delta):
	var collision = move_and_collide(mov * spd * delta)
	
	#gravidade
	if position.y < maxHeight and spd >0:
		mov.y += 0.02
	if upKick:
		mov.x = -mov.x
		mov.y = -mov.y
		spd = spd + 150
		maxHeight -= 140
		upKick = false
	
	#colisões
	if collision:
		if collision.collider.name == "WallLeft" or collision.collider.name == "WallRight":
			mov.x = -mov.x
		if collision.collider.name == "WallTop":
			mov.y = -mov.y
		if collision.collider.name == "WallBottom":
			mov.y = -mov.y
			if spd > 0:
				spd = spd - 100
				if spd >= 0:
					maxHeight += 90
		#if collision.collider.name == "Player":
			#mov.y = -mov.y
			#mov.x = -mov.x
	
	#zera a velocidade caso a bola fique mt proxima ao chão
	if maxHeight >= tela.y + maxHeight:
		spd = 0


func _on_Player_mySignal():
	upKick = true
	print("colidiu")
