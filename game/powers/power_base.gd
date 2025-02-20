extends Area2D

@export_category("Variables")
@export var animated_sprite: AnimatedSprite2D
@export var speed: float
@export var damage: int

var direction: Vector2 = Vector2.ZERO

func _ready():
	animated_sprite.play("default")
	
func _process(delta):
	position += direction * speed * delta
	_look_at_direction()

func set_direction(new_direction: Vector2):
	direction = new_direction.normalized()

func _look_at_direction():
	if direction != Vector2.ZERO:
		rotation = direction.angle()

func _on_colision_area_body_entered(body):
	var enemy = body as EnemyBase
	if enemy:
		enemy.apply_damage(damage)
		queue_free()
