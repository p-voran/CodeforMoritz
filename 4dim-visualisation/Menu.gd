extends Node2D

signal tesseract_3(starting_configuration, minimum_moves, language)
signal cube_2(starting_configuration, minimum_moves, language)
signal tesseract_2(starting_configuration, minimum_moves, language)
signal d_thing(language)

func _ready():

	$CenterContainer/HBoxContainer/VBoxContainer/Tesseract.grab_focus()

	$LanguagePicker.add_item("Deutsch", 0)
	$LanguagePicker.add_item("English", 1)

	$LanguagePicker.selected = 0
	$LanguagePicker.emit_signal("item_selected", 0)

func _on_Tesseract_3_easy_pressed():
	emit_signal("tesseract_3", [3,1,2,0,4,0,0,0,5,0,0,0,0,0,0,0], 8, $LanguagePicker.get_selected_id())

func _on_Tesseract_3_medium_pressed():
	emit_signal("tesseract_3", [2,1,4,0,3,0,0,0,5,0,0,0,0,0,0,0], 9, $LanguagePicker.get_selected_id())

func _on_Tesseract_3_hard_pressed():
	emit_signal("tesseract_3", [1,4,2,0,3,0,0,0,5,0,0,0,0,0,0,0], 10, $LanguagePicker.get_selected_id())

func _on_Tesseract_3_superhard_pressed():
	emit_signal("tesseract_3", [5,1,2,0,3,0,0,0,4,0,0,0,0,0,0,0], 11, $LanguagePicker.get_selected_id())

func _on_Tesseract_3_superhard2_pressed():
	emit_signal("tesseract_3", [1,3,2,0,5,0,0,0,4,0,0,0,0,0,0,0], 11, $LanguagePicker.get_selected_id())

func _on_Cube_2_easy_pressed():
	emit_signal("cube_2", [3,1,2,0,4,0,0,0], 6, $LanguagePicker.get_selected_id())

func _on_Cube_2_medium_pressed():
	emit_signal("cube_2", [2,1,4,0,3,0,0,0], 7, $LanguagePicker.get_selected_id())

func _on_Cube_2_hard_pressed():
	emit_signal("cube_2", [1,4,2,0,3,0,0,0], 8, $LanguagePicker.get_selected_id())
	
func _on_Cube_2_impossible_pressed():
	emit_signal("cube_2", [2,1,3,0,4,0,0,0], 1, $LanguagePicker.get_selected_id())

func _on_Button_pressed():
	emit_signal("d_thing", $LanguagePicker.get_selected_id())

func _on_Tesseract_rule_2_pressed():
	emit_signal("tesseract_2", [1,3,2,0,5,0,0,0,4,0,0,0,0,0,0,0], 9, $LanguagePicker.get_selected_id())

func _on_LanguagePicker_item_selected(index):
	#change languages here
	if index == 0:
		$"CenterContainer/HBoxContainer/VBoxContainer3/2d Button".text = "2-d Einbettung"
		
		$"CenterContainer/HBoxContainer/VBoxContainer2/Cube (2) easy".text = "Würfel: einfach"
		$"CenterContainer/HBoxContainer/VBoxContainer2/Cube (2) medium".text = "Würfel: mittel"
		$"CenterContainer/HBoxContainer/VBoxContainer2/Cube (2) hard".text = "Würfel: schwer"
		$"CenterContainer/HBoxContainer/VBoxContainer2/Cube (2) impossible".text = "Würfel: unmöglich"
	elif index == 1: 
		$"CenterContainer/HBoxContainer/VBoxContainer3/2d Button".text = "2-d Embedding"
		
		$"CenterContainer/HBoxContainer/VBoxContainer2/Cube (2) easy".text = "Cube: easy"
		$"CenterContainer/HBoxContainer/VBoxContainer2/Cube (2) medium".text = "Cube: medium"
		$"CenterContainer/HBoxContainer/VBoxContainer2/Cube (2) hard".text = "Cube: hard"
		$"CenterContainer/HBoxContainer/VBoxContainer2/Cube (2) impossible".text = "Cube: impossible"
