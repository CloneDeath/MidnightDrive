extends Node

export var enabled = true;
export var unlock_period = 20;
export var kill_period = 30;

var kill_triggered = false;

var time = 0;

func get_car() -> Spatial: return get_node("../../CarHome/Car") as Spatial;

func _process(delta):
	if (!enabled): return;
	if (kill_triggered): return;
	time += delta;
	if time > kill_period:
		kill_triggered = true;
		$Animation.play("kill");
		get_car().play_window_kill();