extends Position2D

onready var _duck = preload("res://Shooting/Duck.tscn")

func _on_SpawnTimer_timeout():
	instantiate_duck()

func instantiate_duck():
	var node = _duck.instance()
	node.position.y = randf() * 50
	node.speed = randf() * 2 + 1
	add_child(node)
