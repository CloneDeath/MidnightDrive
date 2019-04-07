extends Node

export var enabled = true;
export var unlock_period = 20;
export var kill_max = 30;

export var unlock_variance = 0;
export var kill_variance = 0;

var kill_triggered = false;

var kill_time = 0;
var unlock_time = 0;

func get_car() -> Spatial: return get_node("../../CarHome/Car") as Spatial;
func get_mode(): return get_node("../../Input").mode;
func get_lock_input(): return get_node("../../Input/LockDoor");

func _ready():
	kill_time = rand_range(0, kill_variance);
	unlock_time = rand_range(0, unlock_variance);

func _process(delta):
	if (!enabled): return;
	if (kill_triggered): return;
	check_locks(delta);
	
	var car = get_car();
	if (!car.is_locked()):
		kill_time += delta;
	var can_kill = get_mode() == "driving" && !car.animation_is_playing();
	if kill_time > kill_max && can_kill && !car.is_locked():
		kill_triggered = true;
		$Animation.play("kill");
		car.play_window_kill();

func check_locks(delta):
	unlock_time += delta;
	var car = get_car();
	if unlock_time > unlock_period:
		car.set_lock(false);
		unlock_time = rand_range(0, unlock_variance);
	
	var lock_input = get_lock_input();
	if (lock_input.is_just_pressed()):
		car.set_lock(true);