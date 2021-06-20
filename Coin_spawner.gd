extends Node2D


# Declare member variables here.
var tracks = [280, 530, 780]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_next_spawn():
	randomize()
	var nextTime = rand_range(2, 4)
	$Coin_Timer.wait_time = nextTime
	$Coin_Timer.start()

func _on_Timer_timeout():
	var coinscene = load("res://coins.tscn")
	var coin = coinscene.instance()
	randomize()
	tracks.shuffle()
	coin.position = Vector2(tracks[0], 100)
	add_child(coin)
	set_next_spawn()
	pass # Replace with function body.
