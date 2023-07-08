extends Actor

@export var Bullet : PackedScene

func _process(delta: float) -> void:
	spot_nearest_enemy()
	
func spot_nearest_enemy():
	# loops over the groups array
	for node in get_tree().get_nodes_in_group("player"):
		# finds the nearest position of something in that group relitive to the necromancer
		if node.position >= self.position:
			# if it is then the necromancer shoots
			shoot()
			
func shoot():
	print("shoot")
	# instanciantes the bullet sceane
	var b = Bullet.instantiate()
	# adds the node as a child 
	add_child(b)
	b.transform = $Marker2D.global_transform
	
