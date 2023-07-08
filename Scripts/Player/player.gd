extends Actor

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

#	move_actor(direction, delta)
	move_player(direction, delta)
	
func handle_attack():
	pass

func move_player(direction, delta):
	var screen_size = get_viewport_rect().size
#	var sprite_x = $Sprite.texture.get_width()/ 2.0 
#	var sprite_y = $Sprite.texture.get_height() / 2.0  
	var sprite_x = 50
	var sprite_y = 50
	
	if direction.length() > 0:
		# applys acceleration to the x axis
		velocity.x = move_toward(
			velocity.x, 
			direction.normalized().x * speed, 
			acceleration * delta
		)
		
		# applys acceleration to the Y axis
		velocity.y = move_toward(
			velocity.y, 
			direction.normalized().y * speed, 
			acceleration * delta
		)
		
	else:
		# applys friction to the x axis
		velocity.x = move_toward(velocity.x, 0, friction * delta)
		# applys friction to the y axis
		velocity.y = move_toward(velocity.y, 0, friction * delta)
		
	move_and_slide()
	
	global_position.x = clamp(global_position.x, 0 + sprite_x, screen_size.x - sprite_x)
	global_position.y = clamp(global_position.y, 0 + sprite_y, screen_size.y - sprite_y)
	
#	self.position.x = clamp(self.position.x, 0, screen_size.x - sprite_x)
#	self.position.y = clamp(self.position.y, 0, screen_size.y - sprite_y)
