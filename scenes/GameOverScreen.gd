extends Node2D

func _ready():
	$CenterContainer/ScoreLabel.text = "you gobbled " + String(State.score) + " yums in " + String(State.seconds) + " seconds"

func on_RestartTimer_timeout():
	get_tree().change_scene("res://scenes/StartScreen.tscn")
