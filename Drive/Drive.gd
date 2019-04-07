extends Spatial

signal player_lost();
signal player_won();

var time = 0;
export var time_max = 60;
var win_triggered = false;

func _process(delta):
	detect_loss();
	update_time(delta);

func update_time(delta):
	time = clamp(time + delta, 0, time_max);
	$CarHome/Car/Interior/Clock.time = time / time_max;
	if (time >= time_max && !win_triggered):
		win_triggered = true;
		emit_signal("player_won");

func detect_loss():
	var position = $CarHome/Car.translation.x + 1.5;
	if (position > 7.5 || position < -7.5):
		emit_signal("player_lost");