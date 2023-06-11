extends Node2D

signal score

onready var point = $Point

const SPEED = 165

func _physics_process(delta):
	position.x += -SPEED * delta
	if global_position.x <=-200:
		queue_free()
		#global_position.x = 800
		



func _on_Wall_body_entered(body):
	if body is Player:
		#print("player hit wall")
		if body.has_method("die"):
			body.die()
		


func _on_ScoreArea_body_exited(body):
	if body is Player:
		point.play()
		emit_signal("score")
		
