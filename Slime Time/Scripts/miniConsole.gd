extends Area2D

var has_talked = false
@export var dialogueResource := DialogueResource
@export var dialogueStart : String = "miniConsole1"


func _on_body_entered(body):
	if body.is_in_group("player"):
		if not has_talked:
			DialogueManager.show_dialogue_balloon(load("res://dialogue/main console.dialogue"), "miniConsole1")
			has_talked = true
