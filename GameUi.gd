extends Control

var coins = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Coins/Label.text = String(coins)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_character_coin_collected():
	coins = coins + 1
	$Coins/Label.text = String(coins)
