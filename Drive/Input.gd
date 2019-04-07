extends CanvasLayer

var mode = "driving";

func get_car(): return get_node("../CarHome/Car");
func get_sleepiness(): return get_node("../Events/Sleepiness");

func _process(_delta):
	var sleepiness = get_sleepiness();
	var asleep = sleepiness.sleepiness >= sleepiness.max_sleepiness;
	
	var car = get_car();
	var animating = car.animation_is_playing();
	
	$SteeringWheel.enabled = mode == "driving" && !asleep;
	$GoToRadio.enabled = mode == "driving" && !animating && !asleep;
	$Radio.enabled = mode == "radio" && !asleep;
	$GoToDriveFromRadio.enabled = mode == "radio" && !animating && !asleep;
	$GoToWindow.enabled = mode == "driving" && !animating && !asleep;
	$GoToDriveFromWindow.enabled = mode == "window" && !animating && !asleep;
	$LockDoor.enabled = mode == "window" && !asleep;
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