extends Node

signal play_sound ()

func _ready():
	emit_signal("play_sound")
