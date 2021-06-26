extends Node

var BASE_COUNTER = 1.9
var MAX_COUNTER = 10

var time_passed = 0
var train_counter = 2

var tracks = [300, 550, 800]

var train_scene = load("res://Train.tscn")
var vine_scene = load("res://Vine.tscn")
var tree_scene = load("res://Tree.tscn")

func difficulty(passed):
	var max_difficulty_after = 100
	
	if passed >= max_difficulty_after:
		return 10
	else:
		return int(passed / 10) + 1

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	
	pass # Replace with function body.


var counters = [0.6, 0, 0.3]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_passed += delta
	
	var current_difficulty = difficulty(time_passed)
	
	_maybe_spawn_tree()
	
	for i in range(counters.size()):
		counters[i] -= delta
		if counters[i] <= 0:
			_spawn_train(i)
			var rand_number = randi() % 4
			
			counters[i] = 1.85 + (rand_number * current_difficulty * 0.1)


func _spawn_train(track_index):
	var node = train_scene.instance()
	var position = Vector2(tracks[track_index] - 20.5, -100)
	node.position = position
	node.train_id = train_counter
	_add_random_obstacle(position)
	train_counter += 1
	add_child(node)
	
func _maybe_spawn_tree():
	if randi() % 100 < 1:
		var x_positions = [120, 400, 650, 900]
		var index = randi() % 4
		var position = Vector2(x_positions[index], -100)
		var tree_node = tree_scene.instance()
		tree_node.position = position
		add_child(tree_node)
		

func _add_random_obstacle(position):
	var current_difficulty = difficulty(time_passed)
	var rand_number = randi() % (17 / current_difficulty)
	
	if rand_number == 0:
		var placement = randi() % 3
		print(placement)
		var vine_node = vine_scene.instance()
		vine_node.position = Vector2(position.x, position.y + ((1 - placement) * 50))
		
		add_child(vine_node)
