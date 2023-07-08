extends Node2D

@export var spawn_radius: float
@export var spawn_interval: float

var spawn_timer: Timer
var radius: Vector2
	
func _ready():
	radius = Vector2(spawn_radius, 0)
	
	spawn_timer = Timer.new()
	add_child(spawn_timer)
	
	spawn_timer.wait_time = spawn_interval
	spawn_timer.connect("timeout", _on_spawn_timer_timeout)
	spawn_timer.start()

func configure_spawner(spawner_config: SpawnerConfig):
	pass

func _on_spawn_timer_timeout():
	const enemy_scene = preload("res://Scenes/bear_test.tscn")
	var enemy = enemy_scene.instantiate();
	
	var center_coordinates: Vector2 = get_viewport_rect().size / 2
	var rng = RandomNumberGenerator.new()
	var random_angle = rng.randf_range(0, 360.0)
	var spawn_position: Vector2 = center_coordinates + radius.rotated(random_angle * (2 * PI))
	
	enemy.transform.origin = spawn_position

	add_child(enemy)
