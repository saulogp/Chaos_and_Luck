class_name PlayerController extends CharacterBody2D

enum PlayerState {Normal, Dead}

const SPEED = 300.0
const MAX_HEALTH = 100
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite
@onready var progress_bar_life: ProgressBar = $ProgressBarLife

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
	
