extends Node2D


@export var spawn_radius: float
@export var spawn_interval: float

var spawn_timer: Timer


func _ready():
	# connect() is getting the "timeout" signal and calling a function when the signal is emitted
	spawn_timer = Timer.new()
	spawn_timer.connect("timeout", _on_spawn_timer_timeout)
	add_child(spawn_timer)
	
	# default config defined manually
	configure_spawner(spawn_radius, spawn_interval)
	
	start_spawner()


func start_spawner():	
	spawn_timer.start()


func stop_spawner():
	spawn_timer.stop()


func configure_spawner(radius: float, interval: float):
	if (!spawn_timer.is_stopped()): spawn_timer.stop()
	
	spawn_timer.set_wait_time(interval)
	spawn_radius = radius
	print(interval)


func _on_spawn_timer_timeout():
	var enemy_scene = load("res://Scenes/Protags/protag.tscn")
	var enemy = enemy_scene.instantiate();
	
	var center_coordinates: Vector2 = get_viewport_rect().size / 2
	var rng = RandomNumberGenerator.new()
	var random_angle = rng.randf_range(-180, 180)
	
	var rotated = Vector2(spawn_radius, 0).rotated(random_angle * (2 * PI))
	
	var spawn_position: Vector2 = center_coordinates + rotated
	
	enemy.transform.origin = spawn_position
	enemy.add_to_group("protags")
	add_child(enemy)
