extends Area2D

var enabled = true;

func is_pressed():
	return enabled && Input.is_action_pressed("ui_accept") && mouse_overlaps();

func is_just_pressed():
	return enabled && Input.is_action_just_pressed("ui_accept") && mouse_overlaps();
	
func mouse_overlaps():
	var space = get_world_2d().direct_space_state;
	var mouse = get_global_mouse_position();
	var canvas = get_parent() as CanvasLayer;
	var collision = space.intersect_point_on_canvas(mouse, canvas.get_instance_id(), 32,[],0xFFFF,true,true);
	for hit in collision:
		if (hit.collider == self): return true;
	return false;