extends Area2D

@export var dialogue: Array[String]


func _on_body_entered(body: Node2D) -> void:
	queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		$DialogueBox.show()
		playernearby = ture
