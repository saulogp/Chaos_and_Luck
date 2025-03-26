extends Node2D

@onready var screen_size = get_viewport_rect().size
var spawn_margin: int = 100
var spawn_position = Vector2.ZERO

func _ready():
	$Player.position = get_viewport_rect().size / 2
	_spawn_enemy(0)

func _process(_delta: float):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()

func _spawn_enemy(e: int):
	var enemy = Global.enemies[e]
	var quantity = Global.enemies_dic[enemy]
	for q in quantity:
		var side = randi() % 4
		match side:
			0:
				spawn_position = Vector2(randi() % int(screen_size.x), -spawn_margin)
			1:
				spawn_position = Vector2(randi() % int(screen_size.x), screen_size.y + spawn_margin)
			2:
				spawn_position = Vector2(-spawn_margin, randi() % int(screen_size.y))
			3:
				spawn_position = Vector2(screen_size.x + spawn_margin, randi() % int(screen_size.y))
		
		var instance = enemy.instantiate()
		instance.global_position = spawn_position
		add_child(instance)

func _on_spawn_enemy_timer_timeout() -> void:
	if Global.player:
		_spawn_enemy(randi() % 2)
