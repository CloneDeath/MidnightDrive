extends Spatial

export var RoadDrift = true;

func _ready():
	$Events/RoadDrift.enabled = RoadDrift;