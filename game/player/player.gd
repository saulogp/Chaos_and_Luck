class_name PlayerController extends CharacterBody2D

enum PlayerState {Normal, Dead}

const SPEED = 300.0
const MAX_HEALTH = 100
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite
@onready var progress_bar_life: ProgressBar = $ProgressBarLife

var fire_rate: float = 1.0
var time_since_last_shoot: float = 0.0

var takeHit = false
var current_health: int
var current_state: PlayerState:
	set(new_value):
		match new_value:
			PlayerState.Dead:
				animated_sprite.play("death")
				current_state = PlayerState.Dead
				Global.player = null

func _ready():
	Global.player = self
	current_health = MAX_HEALTH
	progress_bar_life.visible = true
	progress_bar_life.max_value = MAX_HEALTH
	current_state = PlayerState.Normal

func _process(delta):
	_animation()
	progress_bar_life.value = current_health
	
	time_since_last_shoot += delta
	if time_since_last_shoot >= fire_rate:
		_shoot()
		time_since_last_shoot = 0.0

func _physics_process(_delta: float):
	_moviment()

func _animation():
	if current_state == PlayerState.Dead:
		progress_bar_life.visible = false
		return
		
	if velocity.x > 0:
		animated_sprite.flip_h = true
	else:
		animated_sprite.flip_h = false
	
	if takeHit:
		animated_sprite.play("hit")
		await animated_sprite.animation_finished
		takeHit = false
	else:
		animated_sprite.play("idle")

func _moviment():
	if current_state == PlayerState.Dead:
		velocity = Vector2.ZERO
		move_and_slide()
		return
	
	var direction = Input.get_vector("ui_left", "ui_right","ui_up", "ui_down")
	velocity = SPEED * direction
	move_and_slide()

func _apply_damage(damage: int):
	if current_state == PlayerState.Dead:
		return
		
	takeHit = true
	current_health -= damage
	print(current_health)
	
	if current_health <= 0:
		current_health = 0
		current_state = PlayerState.Dead
	
func _shoot():
	var random_direction = Vector2.ZERO
	for p in Global.mypowers:
		var power = p.instantiate()
		power.position = position
		random_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1))
		power.set_direction(random_direction)
		get_parent().add_child(power)
