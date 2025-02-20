extends Node2D

@onready var screen_size = get_viewport_rect().size
var spawn_margin: int = 100
var spawn_position = Vector2.ZERO

func _ready():
	$Player.position = get_viewport_rect().size / 2
	_spawn_enemy()

func _process(_delta: float):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()

func _spawn_enemy():
	var e = randi() % 2
	var enemy = Global.enemies[e].instantiate()
	
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
	
	enemy.global_position = spawn_position
	add_child(enemy)

func _on_spawn_enemy_timer_timeout() -> void:
	_spawn_enemy()
