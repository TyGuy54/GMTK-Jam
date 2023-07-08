extends Actor

@export var cooldown = 0.75
@export var Bullet : PackedScene

var can_shoot = true

func _ready():
	start()

func _process(delta: float) -> void:
	spot_nearest_enemy()
	
func start():
	$Projectile_Cooldown.wait_time = cooldown
	
func spot_nearest_enemy():
	# loops over the groups array
	for node in get_tree().get_nodes_in_group("player"):
		# finds the nearest position of something in that group relitive to the necromancer
		if node.position >= self.position:
			# if it is then the necromancer shoots
			shoot()

func shoot():
	if not can_shoot:
		return
	can_shoot = false
	$Projectile_Cooldown.start()
	
	# instanciantes the bullet sceane
	var b = Bullet.instantiate()
	# adds the node as a child 
	owner.add_child(b)
	b.transform = $Marker2D.global_transform
	
func _on_projectile_cooldown_timeout() -> void:
	can_shoot = true
