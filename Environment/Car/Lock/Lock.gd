extends Spatial

var locked = false;

func set_lock(locked):
	if (self.locked != locked):
		if (locked):
			$Animation.play("lock");
		else:
			$Animation.play("unlock");
	self.locked = locked;

func is_locked():
	return $Animation.is_playing() || locked;