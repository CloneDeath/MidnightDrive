extends Spatial

var time = 0;

func _process(_delta):
	$Dial.rotation_degrees.z = time * 180.0;