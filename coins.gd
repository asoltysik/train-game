extends Area2D

var counter = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2(0, 1.7)
	pass

func _on_coins_body_entered(body):
	queue_free()
	body.add_coin()
	
