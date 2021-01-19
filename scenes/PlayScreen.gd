extends Node2D

func _ready():
	Music.play()

func on_Timer_timeout():
	$SecondsLabel.text = String(State.seconds) + " seconds"
	$ScoreLabel.text = String(State.score) + " gobbled"
