extends CollisionShape2D

@onready var urubu: RigidBody2D = $"../.."

func _on_area_2d_body_entered(body):
	if body.name == "CharacterBody2D":
		var y_delta = body.global_position.y - global_position.y  # Compare global positions
		
		# Debugging info to print the positions and velocity
		print("y_delta: ", y_delta)
		print("Player Y: ", body.global_position.y, " | Enemy Y: ", global_position.y)
		print("Player velocity Y: ", body.velocity.y)
		
		# Access the parent node correctly
		var enemy = get_parent().get_parent()  # Go up two levels if Area2D is a direct child of RigidBody2D
		
		if enemy:
			print("Enemy found: ", enemy.name)  # Print the name of the enemy node
		else:
			print("Enemy node not found")
		
		if y_delta < 97:  # Player is above the enemy
			print("Destroy enemy")
			if enemy:
				enemy.queue_free()  # Destroy the entire enemy (including the sprite)
			body.jump()   # Make the player jump after killing the enemy
		else:
			print("Kill player")
			body.queue_free()  # Kill the player
			get_tree().reload_current_scene()
			
