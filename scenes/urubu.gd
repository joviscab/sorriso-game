extends CollisionShape2D

@onready var urubu: RigidBody2D = $"../.."
@onready var death_timer: Timer = $"DeathTimer"

func _ready():
	# Ensure the Timer is properly configured
	death_timer.wait_time = 0.4  # 1 second delay
	death_timer.one_shot = true
	death_timer.connect("timeout", Callable(self, "_on_death_timer_timeout"))

func _on_area_2d_body_entered(body):
	if body.name == "CharacterBody2D":
		var y_delta = body.global_position.y - global_position.y  # Compare global positions
		
		# Debugging info to print the positions and velocity
		print("y_delta: ", y_delta)
		print("Player Y: ", body.global_position.y, " | Enemy Y: ", global_position.y)
		print("Player velocity Y: ", body.velocity.y)
		
		var enemy = get_parent().get_parent()  # Access the enemy node correctly

		if enemy:
			print("Enemy found: ", enemy.name)
			if y_delta < 97:  # Player is above the enemy
				print("Destroy enemy")
				var enemy_sprite = enemy.get_node("AnimatedSprite2D")
				if enemy_sprite:
					enemy_sprite.play("death")
					print("Playing death animation")
					death_timer.start()  # Start the timer to delay removal
				else:
					print("AnimatedSprite2D node not found in enemy")
				body.jump()  # Make the player jump after killing the enemy
			else:
				print("Kill player")
				body.queue_free()  # Kill the player
				get_tree().reload_current_scene()

func _on_death_timer_timeout():
	if urubu:
		print("Removing enemy: ", urubu.name)  # Confirm the enemy being removed
		urubu.queue_free()  
