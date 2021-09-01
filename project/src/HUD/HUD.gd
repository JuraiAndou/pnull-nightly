extends CanvasLayer

var combo = 1
var score_final = 0
var lifes = 3
var hud_stage = 0

func _ready():
	$winning.visible = false

func get_combo(c):
	combo = c 

func inimigo_destruido(score):
	score_final = score_final + (score * combo)
	$Score.text = str(score_final)

func _on_Player_hit():
	lifes -= 1
	$Vida/Label.text = str(lifes)

func _on_World_game_end():
	hud_stage = 1
	$winning/sound.play()

func _process(delta):
	if hud_stage == 1:
		$winning/Label2/Score.text = str(score_final)
		$winning.visible = true
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().reload_current_scene()
		
		if Input.is_action_just_pressed("ui_cancel"):
			get_tree().change_scene("res://src/Menu/Menu.tscn")
