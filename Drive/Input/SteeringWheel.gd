extends Area2D

signal is_pressed();

func _physics_process(_delta):
	if (Input.is_action_pressed("ui_accept") && mouse_overlaps()):
		emit_signal("is_pressed");

func mouse_overlaps():
	var space = get_world_2d().direct_space_state;
	var mouse = get_global_mouse_position();
	var collision = space.intersect_point(mouse,32,[ ],0xFFFF,true,true);
	print(collision);
	for hit in collision:
		if (hit.collider == self): return true;
	return false;