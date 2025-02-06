extends Node2D

func _ready():
	$Player.position = get_viewport_rect().size / 2

func _process(delta: float):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
