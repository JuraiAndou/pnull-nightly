extends Node2D

var menuStage = 0 
var itemSelected = 0

#sinal para o Observer do som
signal play_sound (som)

func _ready():
	get_tree().paused = false
	emit_signal("play_sound", "menu")

#funcionamente do menu inicial
func menuInicial():
	if Input.is_action_just_pressed("ui_accept"):
		emit_signal("play_sound", "accept")
		menuStage = 1

#Funcionamenta do menu principal
func menuPrincipal():
	#capta os inputs e move o estado do item selecionado no menu
	if Input.is_action_just_pressed("ui_right"):
		emit_signal("play_sound", "move")
		itemSelected +=1
		
	if Input.is_action_just_pressed("ui_left"):
		emit_signal("play_sound", "move")
		itemSelected -=1
		
	if Input.is_action_just_pressed("ui_accept"):
		#decide o que irá ser feito baseado na posição do cursor
		match itemSelected:
			0:	
				emit_signal("play_sound", "accept")
				get_tree().change_scene("res://src/Intro/intro.tscn")
			1:
				emit_signal("play_sound", "accept")
				menuStage = 2 
			2:
				get_tree().quit()
	
	#impede o cursor de ir além das opções no menu
	if itemSelected < 0:
		itemSelected = $Options.get_child_count() - 2
	if itemSelected > $Options.get_child_count() - 2:
		itemSelected = 0
		
	#Define aposição do cursor do menu
	$Options/pointer.global_position = $Options.get_child(itemSelected).global_position - Vector2(15,-35)

#Funcionamento do menu de controles
func menuControles():
	if Input.is_action_just_pressed("ui_accept"):
		emit_signal("play_sound", "accept")
		menuStage = 1
	
func _process(delta):
	#muda a aba do menu
	match menuStage:
		0:
			menuInicial()
			$Start.visible = true
			$Options.visible = false
			$tela_controles.visible = false
	
		1:
			$Start.visible = false
			$Options.visible = true
			$tela_controles.visible = false
			menuPrincipal()
		
		2:
			$Start.visible = false
			$Options.visible = false
			$tela_controles.visible = true
			menuControles()
