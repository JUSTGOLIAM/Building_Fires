extends StaticBody2D

var player_near = false



func _on_checking_body_entered(body: Node2D) -> void:
	player_near = true
	print("E")
