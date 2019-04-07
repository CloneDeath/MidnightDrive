extends Spatial

class LevelInfo:
	func _init(animation, scene):
		self.animation = animation;
		self.scene_name = scene;
	var animation = "level01";
	var scene_name = "res://Levels/Level01.tscn"

var levels = [
	LevelInfo.new("level01", "res://Levels/Level01.tscn"),
	LevelInfo.new("level02", "res://Levels/Level02.tscn"),
	LevelInfo.new("you_win", "res://Levels/YouWin.tscn")
];
var current_level = 0;

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
	start_level(0);

func _process(_delta):
	if (Input.is_action_just_pressed("ui_cancel")):
		get_tree().quit();

func start_level(level_number):
	current_level = level_number;
	var animation = levels[current_level].animation;
	$Animation.play(animation);

func load_level():
	clear_level();
	var level_name = levels[current_level].scene_name;
	var level_scene = load(level_name);
	var level = level_scene.instance();
	level.connect("player_lost", self, "player_lost");
	level.connect("player_won", self, "player_won");
	$CurrentLevel.add_child(level);

func clear_level():
	for child in $CurrentLevel.get_children():
		child.queue_free();

func player_lost():
	clear_level();
	$Animation.play("death_pause");

func player_won():
	clear_level();
	start_level(current_level + 1);

func restart_level():
	start_level(current_level);
	