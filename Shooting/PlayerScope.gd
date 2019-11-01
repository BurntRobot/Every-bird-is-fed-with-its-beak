extends KinematicBody2D

var movement = Vector2()
var speed = 4


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$AnimationPlayer.play("idle")
	OS.window_size = Vector2(512, 512)

func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		$AnimationPlayer.play("shoot")
	else:
		if not $AnimationPlayer.is_playing():
			$AnimationPlayer.play("idle")
		var _mouse = get_local_mouse_position().round()
		movement = _mouse
		movement = move_and_slide(movement * speed)

func _on_Area2D_area_entered(area):
	area.free()
