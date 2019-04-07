extends Spatial

var dial_position = 0;
var adjust_enabled = false;

func adjust_radio(enabled):
	adjust_enabled = enabled;

func _process(delta):
	$Tuning.stream_paused = !adjust_enabled;
	if (adjust_enabled):
		dial_position += delta;
		set_dial(dial_position);

func set_dial(amount):
	amount = sin(amount) / 2 + 0.5;
	$Knob/RadioStation.translation.x = amount * 1.6;