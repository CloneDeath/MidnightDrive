extends Spatial

var dial_position = 0;
var adjust_enabled = false;
var current_station = 0;

func _ready():
	pick_new_station();
	randomize_stream_position($Tuning);
	for child in $Stations.get_children():
		randomize_stream_position(child);

func randomize_stream_position(audio):
	var length = audio.stream.get_length();
	audio.seek(rand_range(0, length));

func play_current_station():
	for child in $Stations.get_children():
		child.stream_paused = true;
	$Stations.get_child(current_station).stream_paused = adjust_enabled;

func pick_new_station():
	var new_station = randi() % $Stations.get_child_count();
	if current_station == new_station:
		pick_new_station();
	else:
		current_station = new_station;

func adjust_radio(enabled):
	adjust_enabled = enabled;

func _process(delta):
	$Tuning.stream_paused = !adjust_enabled;
	play_current_station();
	if (adjust_enabled):
		dial_position += delta;
		set_dial(dial_position);
		pick_new_station();

func set_dial(amount):
	amount = sin(amount) / 2 + 0.5;
	$Knob/RadioStation.translation.x = amount * 1.6;