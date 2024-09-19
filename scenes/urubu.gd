extends CollisionShape2D

@onready var urubu: RigidBody2D = $"../.."
@onready var death_timer: Timer = $"DeathTimer"

func _ready():
	# Ensure the Timer is properly configured
	death_timer.wait_time = 0.4  # 0.4 seconds delay
	death_timer.one_shot = true
	death_timer.connect("timeout", Callable(self, "_on_death_timer_timeout"))

func _on_area_2d_body_entered(body):
	if body.name == "CharacterBody2D":
		var y_delta = body.global_position.y - global_position.y  # Compare global positions
		
		var enemy = get_parent().get_parent()  # Access the enemy node correctly

		if enemy:
			if y_delta < 97:  # Player is above the enemy
				var enemy_sprite = enemy.get_node("AnimatedSprite2D")
				if enemy_sprite:
					enemy_sprite.play("death")
					death_timer.start()  # Start the timer to delay removal
				body.jump()  # Make the player jump after killing the enemy
			else:
				body.queue_free()  # Kill the player
				get_tree().reload_current_scene()

func _on_death_timer_timeout():
	if urubu:
		urubu.queue_free()  # Remove the enemy
