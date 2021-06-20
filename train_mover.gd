extends Node

var BASE_COUNTER = 1.9
var MAX_COUNTER = 10

var time_passed = 0
var train_counter = 2


var tracks = [300, 550, 800]

var train_scene = load("res://Train.tscn")

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


var counters = [1.85, 0, 1]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_passed += delta
	
	var current_difficulty = difficulty(time_passed)
	
	for i in range(counters.size()):
		counters[i] -= delta
		if counters[i] <= 0:
			for track in tracks:
				var node = train_scene.instance()
				node.position = Vector2(tracks[i] - 20.5, -100)
				node.train_id = train_counter
				train_counter += 1
				add_child(node)
				
				var rand_number = randi() % 4
				
				counters[i] = 1.9 + (rand_number * current_difficulty * 0.2)