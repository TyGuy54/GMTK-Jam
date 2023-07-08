extends Node2D


@export var spawn_radius: float
@export var spawn_interval: float

var _spawn_timer: Timer


func _ready():
	# connect() is getting the "timeout" signal and calling a function when the signal is emitted
	_spawn_timer = Timer.new()
	_spawn_timer.connect("timeout", _on_spawn_timer_timeout)
	add_child(_spawn_timer)
	
	# default config defined manually
	configure_spawner(spawn_radius, spawn_interval)
	
	start_spawner()


func start_spawner():	
	_spawn_timer.start()


func stop_spawner():
	_spawn_timer.stop()


func configure_spawner(radius: float, interval: float):
	_spawn_timer.set_wait_time(interval)
	print(interval)


func _on_spawn_timer_timeout():
	const enemy_scene = preload("res://Scenes/bear_test.tscn")
	var enemy = enemy_scene.instantiate();
	
	var center_coordinates: Vector2 = get_viewport_rect().size / 2
	var rng = RandomNumberGenerator.new()
	var random_angle = rng.randf_range(-180, 180)
	
	var rotated = Vector2(spawn_radius, 0).rotated(random_angle * (2 * PI))
	
	var spawn_position: Vector2 = center_coordinates + rotated
	
	enemy.transform.origin = spawn_position
	
	add_child(enemy)
