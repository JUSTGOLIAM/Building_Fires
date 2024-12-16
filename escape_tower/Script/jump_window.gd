extends Area2D
var player_near = false
var window = true


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_near = true
		print(body)
		
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action("open") and player_near and window:
		window = false
		print("jump out")
		get_tree().change_scene_to_file("res://Scene/next/jump_end.tscn")
