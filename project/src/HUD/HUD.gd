extends CanvasLayer

var combo = 1
var score_final = 0
var lifes = 3

func inimigo_destruido(score):
	score_final = score_final + (score * combo)
	$Score.text = str(score_final)



func _on_Player_hit():
	lifes -= 1
	$Vida/Label.text = str(lifes)
