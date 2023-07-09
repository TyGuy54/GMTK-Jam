extends Actor

@export var cooldown = 0.75
@export var Bullet : PackedScene
@onready var animation = $"AnimationPlayer"

var can_shoot = true


func _ready():
	var center_coordinates: Vector2 = get_viewport_rect().size / 2
	self.transform.origin = center_coordinates
	animation.play("little_dude")
	start()

func _process(delta: float) -> void:
	shoot_nearest_enemy()


func start():
	$Projectile_Cooldown.wait_time = cooldown

var closest_protag = null
var min_distance = Vector2(INF, INF)

func shoot_nearest_enemy():
	var protags = get_tree().get_nodes_in_group("Protag")

	if (protags.size() <= 0):
		closest_protag = null

	for protag in protags:
		if (closest_protag == null):
			closest_protag = protag

		var current_distance = position - protag.position

		if (current_distance < min_distance):
			min_distance = current_distance
			closest_protag = protag

	if (!closest_protag == null):
		shoot(closest_protag.position)


func shoot(protag_position):
	if not can_shoot:
		return
	can_shoot = false
	$Projectile_Cooldown.start()
	
	var bullet = Bullet.instantiate()
	bullet.position = position
	bullet.rotate(bullet.position.angle_to_point(protag_position))
	owner.add_child(bullet)
	
#	var direction = (_position - position).normalized()
	
#	bullet.transform = $Marker2D.global_transform
	
func _on_projectile_cooldown_timeout() -> void:
	can_shoot = true
