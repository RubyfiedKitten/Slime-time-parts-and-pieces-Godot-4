extends StaticBody2D

@export var ThisDoorKey := "green"
@onready var animation_player = $AnimationPlayer
@export var dialogueStart = "GreenDoor"

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		if body.key == ThisDoorKey:
			animation_player.play("unlock")
			animation_player.animation_finished.connect(func(): queue_free())
		else:
			DialogueManager.show_dialogue_balloon(load("res://dialogue/main console.dialogue"), dialogueStart)
