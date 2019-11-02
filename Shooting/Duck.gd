extends KinematicBody2D

export (int) var speed = 2
export (float) var gravity = 2
export (int) var floating_y = 0

var _sign = 1
var motion = Vector2()
var alive = true

func _ready():
	$AnimationPlayer.play("flying")

func _physics_process(delta):
	if alive:
		motion.x += (speed / 13)
	else:
		motion.y += gravity
	motion = move_and_slide(motion)

func _on_Timer_timeout():
	floating_y = randf() * 5
	if _sign == 1:
		_sign = -1
	else:
		_sign = 1
	motion.y = floating_y * _sign

func die():
	$CPUParticles2D.emitting = true
	$AnimationPlayer.play("death")
	alive = false
