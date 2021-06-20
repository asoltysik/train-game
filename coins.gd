extends Area2D

var counter = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2(0, 2)
	pass

func _on_coins_body_entered(body):
	print("Kolizja")
	pass
	
func _on_coins_mouse_entered():
	print("Mouse")
	pass
