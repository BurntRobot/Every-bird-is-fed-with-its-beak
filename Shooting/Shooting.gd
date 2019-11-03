extends Node

func _ready():
	OS.window_size = Vector2(800, 800)
	OS.window_position = Vector2(250, 100)

func _process(delta):
	$Label.text = str($PlayerScope.bullets)
	$Label2.text = str($PlayerScope.dead_ducks)
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
