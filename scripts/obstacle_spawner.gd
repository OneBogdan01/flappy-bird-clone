class_name ObstacleSpawner
extends Node2D

@export var node_to_spawn: PackedScene

signal score_triggered


func spawn():
	var instance = node_to_spawn.instantiate() as ObstaclePair
	instance.score_triggered.connect(_score_triggered)
	add_child(instance)


func _score_triggered():
	score_triggered.emit()


func _ready() -> void:
	spawn()


func _on_timer_timeout() -> void:
	spawn()
