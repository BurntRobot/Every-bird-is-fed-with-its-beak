extends Node

func _ready():
	OS.window_size = Vector2(800, 800)
	OS.window_position = Vector2(250, 100)

func _process(delta):
	$Control/Label.text = str($PlayerScope.bullets)
	$Control2/Label.text = str($PlayerScope.dead_ducks)
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
