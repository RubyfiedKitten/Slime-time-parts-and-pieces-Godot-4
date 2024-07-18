extends Area2D

@onready var animation_player = $AnimationPlayer
var killed = false

func _on_body_entered(body):
	if body.is_in_group("player"):
		if not killed:
			if body.energy >= 1:
				body.energy -= 1
				animation_player.play("collide")
				killed = true
			
			elif body.energy == 0 and body.shield >= 1:
				body.shield -= 1
				animation_player.play("collide")
				killed = true
			
			elif body.shield == 0 and body.energy == 0:
				body.Game_Over()
		
		elif killed:
			if body.has_slime_eliminator_9001:
				animation_player.play("cleaning")
				animation_player.animation_finished.connect(func(): queue_free())
				body.smile += 1
				if not animation_player.is_playing():
					queue_free()
