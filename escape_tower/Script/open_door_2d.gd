extends AnimatedSprite2D

var player_near = false
@onready var door_1: StaticBody2D = $door1

var doorclose = true
func _on_checking_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_near = true
		print(body)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action("open") and player_near and doorclose:
		doorclose = false
		door_1.call_deferred("queue_free")
		#door_1.queue_free()
		print("open")
		play("open")
