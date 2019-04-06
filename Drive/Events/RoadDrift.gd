extends Node

export var enabled = false;
var velocity = 0;

const max_velocity = 3.0;

const correction_acceleration = 1.0;
var correction_amount = 0;

const drift_acceleration = 0.1;
var drift_direction = -1;

func get_car() -> Spatial: return get_node("../../CarHome/Car") as Spatial;
func get_wheel(): return get_node("../../Input/SteeringWheel");

func _ready():
	randomize_direction()

func _physics_process(delta):
	if (!enabled): return;
	update_drift(delta);
	update_control(delta);

func update_drift(delta):
	velocity += delta * (drift_acceleration * drift_direction);
	velocity += delta * (correction_amount * correction_acceleration);
	velocity = clamp(velocity, -max_velocity, max_velocity);
	
	get_car().translation.x += velocity * delta;
	get_car().rotation_degrees.y = -velocity*10;
	get_car().steering_wheel = velocity * 5;

func update_control(delta):
	if (get_wheel().is_pressed()):
		randomize_direction();
		var dp = -get_car().translation.x;
		correction_amount = clamp(dp - velocity, -1, 1);
	else:
		correction_amount = 0;
	

func randomize_direction():
	drift_direction = [-1, 1][randi()%2];