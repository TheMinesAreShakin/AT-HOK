extends KinematicBody2D

var veloctiy: int = 1500


func _process(delta: float) -> void:
	$".".position.y -= veloctiy * delta
