extends Spatial

var steering_wheel = 0;

func _process(_delta):
	$Interior/SteeringWheel.rotation_degrees.z = steering_wheel;
	$Audio.volume_db = abs(steering_wheel);
	$Audio.pitch_scale = 1 + abs(steering_wheel / 16);

func go_to_radio():
	$Animation.play("ToRadio");

func go_to_drive_from_radio():
	$Animation.play_backwards("ToRadio");

func go_to_window():
	$Animation.play("ToWindow");

func go_to_drive_from_window():
	$Animation.play_backwards("ToWindow");

func adjust_radio(delta):
	$Interior/Radio.adjust_radio(delta);

func animation_is_playing():
	return $Animation.is_playing();