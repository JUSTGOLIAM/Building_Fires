extends Node2D


@export var dialogue: Array[String]

var which_line = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#print(dialogue)
	#print(dialogue[0])
	#print(dialogue[1])
	#print(dialogue[2])
	#print(dialogue[3])
	#print(dialogue[4])
	#print(dialogue[5])

# 当玩家进入碰撞区域时触发

var playernearby = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "player_ tutorial":
		$DialogueBox.show()
		playernearby = true



func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "player_ tutorial":
		$DialogueBox.hide()
		playernearby = false
