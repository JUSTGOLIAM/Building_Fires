extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
func firegwrowth():
	scale.x-=0.0035
	scale.y-=0.0035

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_playermoved() -> void:
	firegwrowth()


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "player":
		print ("die die die")
		get_tree().change_scene_to_file("res://Scene/next/dead_level_1.tscn")
		#var Dead_level1=preload("res://Scene/next/dead_level_1.tscn").instantiate()
		#if body.holdingtowel == true:
			#Dead_level1.CauseOfDeath="You got caught on fire becasue you waste too much time on making the wet towel"
		#
		#get_tree().root.add_child(Dead_level1)
		#get_tree().current_scene.queue_free()
	
	
