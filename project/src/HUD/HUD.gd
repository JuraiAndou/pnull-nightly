extends CanvasLayer

var combo = 1
var score_final = 0

func inimigo_destruido(score):
	score_final = score_final + (score * combo)
	$Score.text = str(score_final)
