extends Node

const Yum = preload("res://scenes/Yum.tscn")

var spawned_yum = null

func _ready():
	if State.is_on_tablet:
		$Timer.wait_time = 3

func get_random_point():
	var points = $Points.get_children()
	points.shuffle()
	return points[0]

func spawn_apple():
	if spawned_yum == null:
		spawned_yum = Yum.instance()
		spawned_yum.global_position = get_random_point().global_position
		get_tree().current_scene.add_child(spawned_yum)
	else:
		spawned_yum.queue_free()
		spawned_yum = null


func on_Timer_timeout():
	if !State.game_is_stopped:
		spawn_apple()
