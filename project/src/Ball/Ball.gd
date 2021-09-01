extends KinematicBody2D

var mov = Vector2(1,-1)
var spd = 300
var maxHeight = 500
var tela
var upKick = false

signal play_sound()
signal hit_player()


func _ready():
	tela = get_viewport_rect().size
	
func _physics_process(delta):
	var collision = move_and_collide(mov * spd * delta)
	
	#gravidade
	if position.y < maxHeight and spd >0:
		mov.y += 0.02
	
	#colisões
	if collision:
		#emite som enquanto está com velocidade
		if spd > 0:
			emit_signal("play_sound")
			
		if collision.collider.name == "WallLeft" or collision.collider.name == "WallRight":
			mov.x = -mov.x
		if collision.collider.name == "WallTop":
			mov.y = -mov.y
		if collision.collider.name == "WallBottom":
			mov.y = -mov.y
			if spd > 0:
				spd = spd - 100
				if spd >= 0:
					maxHeight += 150
		if collision.collider.name == "Player" and upKick:
			mov.y = - 1
			mov.x = -mov.x
			if mov.y > 0:
				mov.y = -mov.y
			if spd < 500:
				spd = spd + 100
				maxHeight -= 150
			upKick = false
		elif upKick:
			upKick = false
		elif collision.collider.name == "Player":
			mov.y = -mov.y
			mov.x = -mov.x
			emit_signal("hit_player")
	
	#zera a velocidade caso pare no chão
	if maxHeight >= tela.y + maxHeight:
		spd = 0


func _on_Player_up_kick_signal():
	upKick = true
