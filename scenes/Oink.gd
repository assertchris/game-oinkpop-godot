extends Node2D

const GobbleEffect = preload("res://scenes/GobbleEffect.tscn")
const PopEffect = preload("res://scenes/PopEffect.tscn")

export(int) var SPEED = 75
export(int) var MAX = 15

var is_running = false
var is_frozen = false
var direction = "right"

func _ready():
	$Area.scale = Vector2(1.0, 1.0)

func _process(delta):
	is_running = false

	if is_frozen:
		$Area/Animation.play("Eating")
		return

	if State.score >= MAX:
		show_game_over()
		return

	# if Input.is_action_pressed("ui_left"):
	if State.should_go_left:
		move(-SPEED * delta, 0)
		is_running = true
		direction = "left"
		$Area/Position.position.x = -9
		$Area/Collision.position.x = -6

	# if Input.is_action_pressed("ui_right"):
	if State.should_go_right:
		move(SPEED * delta, 0)
		is_running = true
		direction = "right"
		$Area/Position.position.x = 9
		$Area/Collision.position.x = 6

	# if Input.is_action_pressed("ui_up"):
	if State.should_go_up:
		move(0, -SPEED * delta)
		is_running = true

	# if Input.is_action_pressed("ui_down"):
	if State.should_go_down:
		move(0, SPEED * delta)
		is_running = true

	$Area/Animation.play("Running" if is_running else "Idle")
	$Area/Sprite.flip_h = direction == "left"

func move(x, y):
	$Area.global_position.x += x
	$Area.global_position.y += y

	if $Area.global_position.x < 0:
		$Area.global_position.x = 319

	if $Area.global_position.x > 319:
		$Area.global_position.x = 0

	if $Area.global_position.y < 0:
		$Area.global_position.y = 179

	if $Area.global_position.y > 179:
		$Area.global_position.y = 0

func on_Area_area_entered(area):
	show_gobble()
	area.queue_free()

	is_frozen = true
	$SecondsAndScoreTimer.start()
	State.score += 1
	$Area.scale *= 1.1

func show_gobble():
	var gobbleEffect = GobbleEffect.instance()
	gobbleEffect.global_position = $Area/Position.global_position
	get_tree().current_scene.add_child(gobbleEffect)

func show_pop():
	var popEffect = PopEffect.instance()
	popEffect.global_position = $Area.global_position
	get_tree().current_scene.add_child(popEffect)

func on_SecondsAndScoreTimer_timeout():
	is_frozen = false

func show_game_over():
	State.stop_game()
	Music.stop()
	show_pop()
	queue_free()
