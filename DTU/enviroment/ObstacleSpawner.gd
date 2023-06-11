extends Node2D

signal obstacle_created(obs)

onready var timer = $Timer

var Obstacle = preload ("res://enviroment/Obstacle.tscn")

func _ready():
	randomize()

func _on_Timer_timeout():
	spawn_obstacle()


func spawn_obstacle():
	var obstacle = Obstacle.instance()
	add_child(obstacle)
	#random number between 150-550
	obstacle.position.y = randi()%650 + 200
	emit_signal("obstacle_created", obstacle)


func start():
	timer.start()

func stop():
	timer.stop()