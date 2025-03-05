extends Area2D

enum ItemType { HEALTH, COIN }

@export var item_value: int = 1
@export var item_type: ItemType = ItemType.COIN
@export var animated_2d: AnimatedSprite2D = null

func _ready():
	if animated_2d != null:
		animated_2d.play("default")

func _on_body_entered(body):
	if body.is_in_group("player"):
		collect(body)

func collect(player: Node):
	match item_type:
		ItemType.COIN :
			#player._up_health(item_value)
			pass
		ItemType.HEALTH:
			player._up_health(item_value)
	queue_free()
