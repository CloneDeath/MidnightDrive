extends CanvasLayer

var mode = "driving";

func get_car(): return get_node("../CarHome/Car");

func _process(_delta):
	var car = get_car();
	var animating = car.animation_is_playing();
	
	$SteeringWheel.enabled = mode == "driving";
	$GoToRadio.enabled = mode == "driving" && !animating;
	$Radio.enabled = mode == "radio";
	$GoToDriveFromRadio.enabled = mode == "radio" && !animating;
	$GoToWindow.enabled = mode == "driving" && !animating;
	$GoToDriveFromWindow.enabled = mode == "window" && !animating;
	if ($GoToRadio.is_just_pressed()):
		mode = "radio";
		car.go_to_radio();
	if ($GoToDriveFromRadio.is_just_pressed()):
		mode = "driving";
		car.go_to_drive_from_radio();
	if ($GoToWindow.is_just_pressed()):
		mode = "window";
		car.go_to_window();
	if ($GoToDriveFromWindow.is_just_pressed()):
		mode = "driving";
		car.go_to_drive_from_window();