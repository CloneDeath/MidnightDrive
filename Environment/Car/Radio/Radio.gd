extends Spatial

var dial_position = 0;

func adjust_radio(delta):
	dial_position += delta;
	set_dial(dial_position);

func set_dial(amount):
	amount = sin(amount) / 2 + 0.5;
	$Knob/RadioStation.translation.x = amount * 1.6;