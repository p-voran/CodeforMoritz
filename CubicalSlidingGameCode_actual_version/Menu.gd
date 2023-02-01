extends Node2D

signal tesseract_3(starting_configuration, minimum_moves)
signal cube_2(starting_configuration, minimum_moves)
signal tesseract_2(starting_configuration, minimum_moves)
signal d_thing()


func _ready():
	$CenterContainer/HBoxContainer/VBoxContainer/Tesseract.grab_focus()

func _on_Tesseract_3_easy_pressed():
	emit_signal("tesseract_3", [3,1,2,0,4,0,0,0,5,0,0,0,0,0,0,0], 8)

func _on_Tesseract_3_medium_pressed():
	emit_signal("tesseract_3", [2,1,4,0,3,0,0,0,5,0,0,0,0,0,0,0], 9)

func _on_Tesseract_3_hard_pressed():
	emit_signal("tesseract_3", [1,4,2,0,3,0,0,0,5,0,0,0,0,0,0,0], 10)

func _on_Tesseract_3_superhard_pressed():
	emit_signal("tesseract_3", [5,1,2,0,3,0,0,0,4,0,0,0,0,0,0,0], 11)

func _on_Tesseract_3_superhard2_pressed():
	emit_signal("tesseract_3", [1,3,2,0,5,0,0,0,4,0,0,0,0,0,0,0], 11)

func _on_Cube_2_easy_pressed():
	emit_signal("cube_2", [3,1,2,0,4,0,0,0], 6)

func _on_Cube_2_medium_pressed():
	emit_signal("cube_2", [2,1,4,0,3,0,0,0], 7)

func _on_Cube_2_hard_pressed():
	emit_signal("cube_2", [1,4,2,0,3,0,0,0], 8)

func _on_Button_pressed():
	emit_signal("d_thing")

func _on_Tesseract_rule_2_pressed():
	emit_signal("tesseract_2", [1,3,2,0,5,0,0,0,4,0,0,0,0,0,0,0], 9)
