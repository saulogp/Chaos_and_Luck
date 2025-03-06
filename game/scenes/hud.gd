extends Control

@onready var coin_label = $CoinLabel
@onready var ruby_label = $RubyLabel

func _process(delta):
	if Global.player:
		coin_label.text = str(Global.player.current_coin)
		ruby_label.text = str(Global.player.current_ruby)
