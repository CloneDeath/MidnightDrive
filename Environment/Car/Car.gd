extends Spatial

var steering_wheel = 0;

func _process(_delta):
	$Interior/SteeringWheel.rotation_degrees.z = steering_wheel;

func go_to_radio():
	$Animation.play("ToRadio");

func go_to_drive_from_radio():
	$Animation.play_backwards("ToRadio");

func adjust_radio(delta):
	$Interior/Radio.adjust_radio(delta);