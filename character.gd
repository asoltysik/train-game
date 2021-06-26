extends KinematicBody2D


export var last_train_id = 0
export var is_on_train = true
export var is_in_obstacle = false
export var is_in_tree = false

export var SPEED := 250
var move_vector = Vector2()
var jump = false
var coins = 0
signal coin_collected

enum {RUNNING, JUMPING}

var STATE = RUNNING

var track_position = 1

func _ready():
	pass
	
func _physics_process(delta):
	var lose_condition = is_in_tree or \
		(STATE != JUMPING and (not is_on_train or is_in_obstacle))
	if lose_condition:
		var end_scene = load("res://TheEndScene.tscn").instance()
		end_scene.set_coins(coins);
		get_parent().queue_free()
		get_tree().root.add_child(end_scene)
		print("LOST" + str(OS.get_time()))
	
	if Input.is_action_just_pressed("player_jump"):
		if jump == false:
			jump = true
			STATE = JUMPING
			yield(get_tree().create_timer(1.55), "timeout")
			STATE = RUNNING
			jump = false
		
	if Input.is_action_just_pressed("player_left"):
		if jump == false and track_position > 0:
			jump = true
			STATE = JUMPING
			move_vector.x -= SPEED
			yield(get_tree().create_timer(1.0), "timeout")
			track_position -= 1
			move_vector.x += SPEED
			STATE = RUNNING
			jump = false
		
	if Input.is_action_just_pressed("player_right"):
		if jump == false and track_position < 2:
			jump = true
			STATE = JUMPING
			move_vector.x += SPEED
			yield(get_tree().create_timer(1.0), "timeout")
			track_position += 1
			move_vector.x -= SPEED
			STATE = RUNNING
			jump = false
		
	match STATE:
		RUNNING:
			$Player.play("Run")
		JUMPING:
			$Player.play("Jump")
	
	move_and_slide(move_vector)
	

func add_coin():
	$CollectSound2.play()
	coins = coins + 1
	emit_signal("coin_collected")
