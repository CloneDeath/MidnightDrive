extends Node

export var enabled = false;
var velocity = 0;
var direction = -1;

const correction_speed = 1.0;

func get_car() -> Spatial: return get_node("../../CarHome/Car") as Spatial;
func get_wheel(): return get_node("../../Input/SteeringWheel");

func _ready():
	randomize_direction()

func _physics_process(delta):
	if (!enabled): return;
	update_drift(delta);
	update_control(delta);

func update_drift(delta):
	velocity -= delta * 0.01;
	get_car().translation.x += velocity * delta * direction;

func update_control(delta):
	if (!get_wheel().is_pressed()): return;
	randomize_direction();
	velocity = 0;
	
	var fix_dir = -sign(get_car().translation.x);
	var distance = correction_speed * delta;
	if (distance > abs(get_car().translation.x)):
		get_car().translation.x = 0;
	else:
		get_car().translation.x += distance * fix_dir;

func randomize_direction():
	direction = [-1, 1][randi()%2];