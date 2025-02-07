class_name EnemyBase extends CharacterBody2D

@export_category("Variables")
@export var animated_sprite: AnimatedSprite2D
@export var body_collision: CollisionShape2D
@export var damage_collision: CollisionShape2D
@export var speed: float
@export var damage: int

func _process(_delta: float) -> void:
	_movement()
	_animation()

func _movement():
	if Global.player:
		var direction = (Global.player.global_position - global_position).normalized()
		velocity = speed * direction
		move_and_slide()

func _animation():
	if velocity.x > 0:
		animated_sprite.flip_h = false
	else:
		animated_sprite.flip_h = true
	animated_sprite.play("idle")

func _on_area_damage_body_entered(body):
	var player = body as PlayerController
	if player and Global.player:
		player._apply_damage(damage)
