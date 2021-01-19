extends Node

var score = 0 setget set_score,get_score
var seconds = 0 setget ,get_seconds
var game_is_stopped = false setget ,get_game_is_stopped
var is_on_tablet = false setget ,get_is_on_tablet

var should_go_left = false setget ,get_should_go_left
var should_go_right = false setget ,get_should_go_right
var should_go_up = false setget ,get_should_go_up
var should_go_down = false setget ,get_should_go_down

var is_touching_left = false setget set_is_touching_left,get_is_touching_left
var is_touching_right = false setget set_is_touching_right,get_is_touching_right
var is_touching_up = false setget set_is_touching_up,get_is_touching_up
var is_touching_down = false setget set_is_touching_down,get_is_touching_down

func _ready():
	self.is_on_tablet = OS.get_name() == "iOS" or OS.get_name() == "Android"

func get_is_on_tablet():
	return is_on_tablet

func set_score(value):
	score = value

func get_score():
	return score

func get_seconds():
	return seconds

func get_game_is_stopped():
	return game_is_stopped

func get_should_go_left():
	return should_go_left

func get_should_go_right():
	return should_go_right

func get_should_go_up():
	return should_go_up

func get_should_go_down():
	return should_go_down

func set_is_touching_left(value):
	is_touching_left = value

func get_is_touching_left():
	return is_touching_left

func set_is_touching_right(value):
	is_touching_right = value

func get_is_touching_right():
	return is_touching_right

func set_is_touching_up(value):
	is_touching_up = value

func get_is_touching_up():
	return is_touching_up

func set_is_touching_down(value):
	is_touching_down = value

func get_is_touching_down():
	return is_touching_down

func _process(delta):
	self.should_go_left = false
	self.should_go_right = false
	self.should_go_up = false
	self.should_go_down = false

	if Input.is_action_pressed("ui_left") or self.is_touching_left:
		self.should_go_left = true

	if Input.is_action_pressed("ui_right") or self.is_touching_right:
		self.should_go_right = true

	if Input.is_action_pressed("ui_up") or self.is_touching_up:
		self.should_go_up = true

	if Input.is_action_pressed("ui_down") or self.is_touching_down:
		self.should_go_down = true

func reset_game():
	self.game_is_stopped = false
	self.score = 0
	self.seconds = 0
	$SecondsTimer.start()

func stop_game():
	self.game_is_stopped = true
	$SecondsTimer.stop()
	$GameOverTimer.start()

func on_SecondsTimer_timeout():
	self.seconds += 1

func on_GameOverTimer_timeout():
	get_tree().change_scene("res://scenes/GameOverScreen.tscn")
