extends Spatial

var at_radio = false;
var steering_wheel = 0;

func _input(event):
	return;
	if (event.is_pressed()):
		if (!at_radio):
			$AnimationPlayer.play("ToRadio");
			at_radio = true;
		else:
			$AnimationPlayer.play_backwards("ToRadio");
			at_radio = false;

func _process(_delta):
	$Interior/SteeringWheel.rotation_degrees.z = steering_wheel;