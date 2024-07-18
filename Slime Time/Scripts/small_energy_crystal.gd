extends Area2D


@onready var animation_player = $AnimationPlayer

@warning_ignore("unused_parameter")
func _on_body_entered(body):
	if body.is_in_group("player"):
		animation_player.play("pickup energy")
		body.energy += 1
