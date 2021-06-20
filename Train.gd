extends Area2D

export var train_id = -1

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
	
func _physics_process(delta):
	position.y = position.y + (100 * delta)

func _on_Train_body_entered(body):
	if not body.is_in_group("player"):
		return
	
	if(body.last_train_id < train_id):
		print("joining")
		body.last_train_id = train_id
		body.is_on_train = true
	else:
		pass


func _on_Train_body_exited(body):
	if not body.is_in_group("player"):
		return
	
	if(body.last_train_id == train_id):
		print("leaving")
		body.is_on_train = false
	else:
		pass
