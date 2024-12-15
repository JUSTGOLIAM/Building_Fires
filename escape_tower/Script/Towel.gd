extends Area2D

@export var dialogue: Array[String]


func _on_body_entered(body: Node2D) -> void:
	queue_free()
