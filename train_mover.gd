extends Node


var counter = 2

var tracks = [300, 550, 800]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	counter -= delta
	#if counter <= 0:
		#for track in tracks:
		#	var scene = load("res://Train.tscn")
		#	var node = scene.instance()
		#	node.position = Vector2(track - 20.5, -100)
		#	print(node)
		#	add_child(node)
		#	counter = 2
	pass
