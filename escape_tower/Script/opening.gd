extends Control
var CauseOfDeath="You caught on fire because you waste too much time on your way out"
func _ready() -> void:
	if  $CauseOfDeath:
		$CauseOfDeath.text=CauseOfDeath
	
func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/level_1.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()
