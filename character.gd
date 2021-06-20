extends KinematicBody2D

export var SPEED := 160
var move_vector = Vector2.ZERO
var jump = false

enum {RUNNING, JUMPING}

var STATE = RUNNING

func _ready():
	pass
	
func _process(delta):
	
	
	if Input.is_action_just_pressed("player_jump"):
		if jump == false:
			jump = true
			STATE = JUMPING
			yield(get_tree().create_timer(1.55), "timeout")
			STATE = RUNNING
			jump = false
		
	if Input.is_action_just_pressed("player_left"):
		if jump == false:
			jump = true
			STATE = JUMPING
			move_vector.x -= SPEED
			yield(get_tree().create_timer(1.55), "timeout")
			move_vector.x += SPEED
			STATE = RUNNING
			jump = false
		
	if Input.is_action_just_pressed("player_right"):
		if jump == false:
			jump = true
			STATE = JUMPING
			move_vector.x += SPEED
			yield(get_tree().create_timer(1.55), "timeout")
			move_vector.x -= SPEED
			STATE = RUNNING
			jump = false
		
	match STATE:
		RUNNING:
			$Player.play("Run")
		JUMPING:
			$Player.play("Jump")
	
	move_vector = move_and_slide(move_vector, Vector2.ZERO)

