extends Node2D

var Bites = [
	preload("res://resources/bite-1.ogg"),
	preload("res://resources/bite-2.ogg"),
	preload("res://resources/bite-3.ogg"),
	preload("res://resources/bite-4.ogg"),
]

func _ready():
	$Particles.emitting = true

	Bites.shuffle()
	$Sound.stream = Bites[0]
	$Sound.play()

func on_Timer_timeout():
	queue_free()
