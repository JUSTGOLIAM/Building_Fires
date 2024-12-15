extends Label

var full_text := "It's a fire drill. I got a wet towel 
for you. Get closer to pick up!"
var current_text := ""
var char_index := 0
var typing_speed := 0.05  # Adjust typing speed for faster typing

func _ready():
	set_process(true)
	update_text()

func update_text():
	if char_index < full_text.length():
		current_text = full_text.left(char_index + 1)
		text = current_text
		char_index += 1
	else:
		set_process(false)  # Stop updating when text is fully typed

func _process(delta):
	if char_index < full_text.length():
		typing_speed -= delta
		while typing_speed <= 0 and char_index < full_text.length():
			typing_speed += 0.05  # Adjust typing speed increment for faster typing
			update_text()
