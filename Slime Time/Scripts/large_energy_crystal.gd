extends Area2D

@onready var animation_player = $AnimationPlayer


@warning_ignore("unused_parameter")
func _on_body_entered(body):
	animation_player.play("pickup big energy")
	body.energy += 2
