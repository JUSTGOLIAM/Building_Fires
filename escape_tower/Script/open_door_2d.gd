extends AnimatedSprite2D

var player_near = false
@onready var door_1: StaticBody2D = $door1

var doorclose = true
func _on_checking_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_near = true
		print(body)

func _unhandled_input(event: InputEvent) -> void:
	
	if event.is_action_pressed("open") and player_near and doorclose:
		print("trying to open...")
		doorclose = false
		#door_1.call_deferred("queue_free")
		$door1/CollisionShape2D.disabled = true
		#door_1.queue_free()
		play("open")
