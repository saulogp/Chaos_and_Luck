extends CharacterBody2D

const SPEED = 300.0

func _physics_process(_delta: float):
	_moviment()
	_animation()

func _animation():
	$AnimatedSprite.play("idle")
	pass

func _moviment():
	var direction = Input.get_vector("ui_left", "ui_right","ui_up", "ui_down")
	velocity = SPEED * direction
	move_and_slide()
