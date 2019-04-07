extends CanvasLayer

var mode = "driving";

func get_car(): return get_node("../CarHome/Car");

func _process(_delta):
	$SteeringWheel.enabled = mode == "driving";
	$GoToRadio.enabled = mode == "driving";
	$Radio.enabled = mode == "radio";
	$GoToDriveFromRadio.enabled = mode == "radio";
	if ($GoToRadio.is_just_pressed()):
		mode = "radio";
		get_car().go_to_radio();
	if ($GoToDriveFromRadio.is_just_pressed()):
		mode = "driving";
		get_car().go_to_drive_from_radio();