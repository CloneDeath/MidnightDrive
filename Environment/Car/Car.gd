extends Spatial

var steering_wheel = 0;

func _process(_delta):
	$Interior/SteeringWheel.rotation_degrees.z = steering_wheel;
	$Audio.volume_db = abs(steering_wheel)/2;
	$Audio.pitch_scale = 1 + abs(steering_wheel / 16);

func go_to_radio():
	$Animation.play("ToRadio");

func go_to_drive_from_radio():
	$Animation.play_backwards("ToRadio");

func go_to_window():
	$Animation.play("ToWindow");

func go_to_drive_from_window():
	$Animation.play_backwards("ToWindow");

func play_window_kill():
	$Animation.play("window_kill");

func adjust_radio(enable, sleepiness):
	$Interior/Radio.adjust_radio(enable, sleepiness);

func set_lock(enabled):
	$Interior/Lock.set_lock(enabled);

func is_locked():
	return $Interior/Lock.is_locked();

func animation_is_playing():
	return $Animation.is_playing();