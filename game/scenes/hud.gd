extends Control

@onready var coin_label = $CoinLabel
@onready var ruby_label = $RubyLabel
@onready var timer = $Timer

var time_elapsed: float = 0.0

func _process(delta):
	if Global.player:
		coin_label.text = str(Global.player.current_coin)
		ruby_label.text = str(Global.player.current_ruby)
		time_elapsed += delta
		update_display()

func update_display() -> void:
	var minutes: int = int(time_elapsed) / 60
	var seconds: int = int(time_elapsed) % 60
	var time_string: String = "%02d:%02d" % [minutes, seconds]
	timer.text = time_string
