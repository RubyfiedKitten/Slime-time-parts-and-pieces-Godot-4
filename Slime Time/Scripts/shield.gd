extends Area2D


@onready var animation_player = $AnimationPlayer


func _on_body_entered(body):
	if body.is_in_group("player"):
		animation_player.play("pickup")
		body.shield += 1
		animation_player.animation_finished.connect(func(): queue_free())
