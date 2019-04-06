extends Spatial

signal player_lost();

export var RoadDrift = true;

func _ready():
	$Events/RoadDrift.enabled = RoadDrift;

func _process(_delta):
	var position = $CarHome/Car.translation.x + 1.5;
	if (position > 7.5 || position < -7.5):
		emit_signal("player_lost");