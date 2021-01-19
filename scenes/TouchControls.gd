extends Node2D

const NoHighlight = preload("res://resources/arrows-x-1-idle-1-black.png")
const LeftHighlight = preload("res://resources/arrows-left-1-idle-1-red.png")
const RightHighlight = preload("res://resources/arrows-right-1-idle-1-red.png")
const UpHighlight = preload("res://resources/arrows-top-1-idle-1-red.png")
const DownHighlight = preload("res://resources/arrows-bottom-1-idle-1-red.png")

func _ready():
	if not State.is_on_tablet:
		visible = false

func _process(delta):
	$Sprite.texture = NoHighlight
	
	if State.is_touching_left:
		$Sprite.texture = LeftHighlight
	
	if State.is_touching_right:
		$Sprite.texture = RightHighlight
	
	if State.is_touching_up:
		$Sprite.texture = UpHighlight
	
	if State.is_touching_down:
		$Sprite.texture = DownHighlight

func on_LeftButton_pressed():
	State.is_touching_left = true

func on_LeftButton_released():
	State.is_touching_left = false

func on_UpButton_pressed():
	State.is_touching_up = true

func on_UpButton_released():
	State.is_touching_up = false

func on_RightButton_pressed():
	State.is_touching_right = true

func on_RightButton_released():
	State.is_touching_right = false

func on_DownButton_pressed():
	State.is_touching_down = true

func on_DownButton_released():
	State.is_touching_down = false
