class_name EnemyBase extends CharacterBody2D

@export_category("Variables")
@export var animated_sprite: AnimatedSprite2D
@export var body_collision: CollisionShape2D
@export var speed: float

func _process(_delta: float) -> void:
	_movement()
	_animation()

func _movement():
	var direction = (Global.player.global_position - global_position).normalized()
	velocity = speed * direction
	move_and_slide()

func _animation():
	if velocity.x > 0:
		animated_sprite.flip_h = false
	else:
		animated_sprite.flip_h = true
	animated_sprite.play("idle")
