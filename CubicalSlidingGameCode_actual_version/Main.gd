extends Node

func _on_Menu_tesseract_3(starting_configuration, minimum_moves):
	var new_scene = load("res://TesseractGame3.tscn")
	var game = new_scene.instance()
	game.starting_configuration = starting_configuration
	game.minimum_moves = minimum_moves
	add_child(game)
	game.connect("quit_to_title", self, "quit_to_title_handler")
	self.get_child(0).queue_free()

func quit_to_title_handler():
	self.get_child(0).queue_free()
	var new_scene = load("res://Menu.tscn")
	var menu = new_scene.instance()
	add_child(menu)
	menu.connect("cube_2", self, "_on_Menu_cube_2")
	menu.connect("tesseract_3", self, "_on_Menu_tesseract_3")
	menu.connect("tesseract_2", self, "_on_Menu_tesseract_2")
	menu.connect("d_thing", self, "_on_Menu_d_thing")


func _on_Menu_cube_2(starting_configuration, minimum_moves):
	var new_scene = load("res://CubeGame2.tscn")
	var game = new_scene.instance()
	game.starting_configuration = starting_configuration
	game.minimum_moves = minimum_moves
	add_child(game)
	game.connect("quit_to_title", self, "quit_to_title_handler")
	self.get_child(0).queue_free()


func _on_Menu_d_thing():
	var new_scene = load("res://2dthing/Main.tscn")
	var game = new_scene.instance()
	add_child(game)
	game.connect("quit_to_title", self, "quit_to_title_handler")
	self.get_child(0).queue_free()

func _on_Menu_tesseract_2(starting_configuration, minimum_moves):
	var new_scene = load("res://TesseractGame2.tscn")
	var game = new_scene.instance()
	game.starting_configuration = starting_configuration
	game.minimum_moves = minimum_moves
	add_child(game)
	game.connect("quit_to_title", self, "quit_to_title_handler")
	self.get_child(0).queue_free()
