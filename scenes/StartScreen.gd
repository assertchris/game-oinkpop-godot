extends Node2D

func _ready():
	if State.is_on_tablet:
		$CenterContainer/StartLabel.text = "tap to gobble"
	else:
		$CenterContainer/StartLabel.text = "press space to gobble"

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		start_game()

func start_game():
	get_tree().change_scene("res://scenes/PlayScreen.tscn")
	State.reset_game()

func on_TouchScreenButton_pressed():
	start_game()
