extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
func firegwrowth():
	scale.x-=0.005
	scale.y-=0.005

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_playermoved() -> void:
	firegwrowth()


func _on_area_2d_body_exited(body: Node2D) -> void:
	print ("die die die")
	
