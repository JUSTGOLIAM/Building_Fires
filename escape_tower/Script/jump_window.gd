extends Area2D
var player_near = false
var window = true

const JUMP_END = preload("res://Scene/next/jump_end.tscn")
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_near = true
		print(body)
		
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("open") and player_near and window:
		window = false
		print("jump out")
		call_deferred_thread_group("change_scene")
func change_scene():
		get_tree().change_scene_to_packed(JUMP_END)




func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_near = false
