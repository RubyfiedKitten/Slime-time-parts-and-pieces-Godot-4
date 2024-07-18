extends Area2D


@export var key := "Green"
@onready var animation_player = $AnimationPlayer



func _on_body_entered(body):
	if body.is_in_group("player"):
		body.slime -= 1
		body.key = key 
		animation_player.play("pickup")
