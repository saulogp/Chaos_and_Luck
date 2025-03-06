class_name EnemyBase extends CharacterBody2D

@export_category("Variables")
@export var animated_sprite: AnimatedSprite2D
@export var body_collision: CollisionShape2D
@export var damage_collision: CollisionShape2D
@export var speed: float
@export var damage: int
@export var health: int
@export var drop_chance: float = 0.5
@export var drop_food_chance: float = 0.5

var is_dead = false

func _process(_delta: float) -> void:
	_movement()
	_animation()

func _movement():
	if Global.player and !is_dead:
		var direction = (Global.player.global_position - global_position).normalized()
		velocity = speed * direction
		move_and_slide()

func _animation():
	if is_dead:
		animated_sprite.play("death")
		await animated_sprite.animation_finished
		queue_free()
	else:
		if velocity.x > 0:
			animated_sprite.flip_h = false
		else:
			animated_sprite.flip_h = true
		animated_sprite.play("idle")

func _on_area_damage_body_entered(body):
	var player = body as PlayerController
	if player and Global.player:
		player._apply_damage(damage)

func apply_damage(new_damage: int):
	health -= new_damage
	if health <= 0:
		is_dead = true
		if randf() <= drop_chance:
			drop_item()

func drop_item():
	var item: Area2D
	if randf() <= drop_food_chance:
		item = Global.foods[randi() % Global.foods.size()].instantiate()
	else:
		item = Global.itens[randi() % Global.itens.size()].instantiate()
	
	item.position = position
	get_parent().call_deferred("add_child",item)
