extends Node

export var enabled = false;
var velocity = 0;

func get_car() -> Spatial:
	return get_node("../../CarHome/Car") as Spatial;

func _process(delta):
	if (!enabled): return;
	velocity -= delta * 0.001;
	get_car().translation.x += velocity;

func _on_SteeringWheel_is_pressed():
	print("WHEE:L");
	velocity = 0;
	get_car().translation.x = 0;
