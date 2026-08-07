extends Node
@export var obstacle_spawner: ObstacleSpawner


func _ready() -> void:
	obstacle_spawner.score_triggered.connect(%Score.increment)


func _on_player_hit_enviroment() -> void:
	print("Game Over!")
