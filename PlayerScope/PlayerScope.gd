extends KinematicBody2D

var movement = Vector2()
var speed = 3
var on_cooldown = false
var bullets = 30
var dead_ducks = 0
var game_started = false
signal end_game


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED and Input.MOUSE_MODE_HIDDEN)
	$AnimationPlayer.play("idle")

func _process(delta):
	if not on_cooldown:
		if Input.is_action_just_pressed("shoot") and bullets != 0:
			$AnimationPlayer.play("shoot")
			$AudioStreamPlayer2D.play()
			on_cooldown = true
			$CooldownTimer.start()
			if game_started:
				bullets -= 1
		else:
			if not $AnimationPlayer.is_playing():
				$AnimationPlayer.play("idle")
			var _mouse = get_local_mouse_position().round()
			movement = _mouse
			movement = move_and_slide(movement * speed)
	if bullets == 0:
		get_tree().paused = true
		emit_signal("end_game")

func _on_Area2D_body_entered(body):
	dead_ducks += 1
	body.die()

func _on_CooldownTimer_timeout():
	on_cooldown = false
