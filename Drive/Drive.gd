extends Spatial

signal player_lost();

export var RoadDrift = true;
var time = 0;
var time_max = 60;

func _ready():
	$Events/RoadDrift.enabled = RoadDrift;

func _process(delta):
	detect_loss();
	update_time(delta);

func update_time(delta):
	time = clamp(time + delta, 0, time_max);
	$CarHome/Car/Interior/Clock.time = time / time_max;

func detect_loss():
	var position = $CarHome/Car.translation.x + 1.5;
	if (position > 7.5 || position < -7.5):
		emit_signal("player_lost");