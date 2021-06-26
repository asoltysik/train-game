extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	position.y = position.y + (100 * delta)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Tree_body_entered(body):
	if not body.is_in_group("player"):
		return
	
	body.is_in_tree = true


func _on_Tree_body_exited(body):
	if not body.is_in_group("player"):
		return
	
	body.is_in_tree = false
