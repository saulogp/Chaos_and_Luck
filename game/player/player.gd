class_name PlayerController extends CharacterBody2D

const SPEED = 300.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite

func _ready():
	Global.player = self

func _physics_process(_delta: float):
	_moviment()
	_animation()

func _animation():
	if velocity.x > 0:
		animated_sprite.flip_h = true
	else:
		animated_sprite.flip_h = false
	
	animated_sprite.play("idle")

func _moviment():
	var direction = Input.get_vector("ui_left", "ui_right","ui_up", "ui_down")
	velocity = SPEED * direction
	move_and_slide()
