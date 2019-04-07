extends Node

export var enabled = false;

func get_radio(): return get_node("../../Input/Radio");
func get_car() -> Spatial: return get_node("../../CarHome/Car") as Spatial;

var sleepiness = 0;
var sleepiness_velocity = 0;
var sleepiness_acceleration = 0.1;
var max_sleepiness = 20;

func _process(delta):
	if (!enabled): return;
	update_sleepiness(delta);
	check_radio(delta);

func update_sleepiness(delta):
	sleepiness_velocity += sleepiness_acceleration * delta;
	sleepiness = min(sleepiness + (sleepiness_velocity * delta), max_sleepiness);
	var square = get_node("../../SleepinessLayer/Sleepiness") as ColorRect;
	var scale = sleepiness / max_sleepiness;
	square.material.set_shader_param("sleepiness", scale);

func check_radio(delta):
	var radio = get_radio();
	if (!radio.is_pressed()): return;
	
	sleepiness_velocity = 0;
	sleepiness = max(sleepiness - delta, 0);
	get_car().adjust_radio(delta);