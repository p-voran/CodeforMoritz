extends Node
var session_id = 0

func _ready():
	randomize()
	session_id = randi() % 100000
	
func _on_Menu_tesseract_3(starting_configuration, minimum_moves, language):
	var new_scene = load("res://TesseractGame3.tscn")
	var game = new_scene.instance()
	game.starting_configuration = starting_configuration
	game.minimum_moves = minimum_moves
	game.language = language
	add_child(game)
	game.connect("quit_to_title", self, "quit_to_title_handler")
	game.connect("send_game_data", self, "_on_send_game_data")
	self.get_child(0).queue_free()

func quit_to_title_handler():
	self.get_child(0).queue_free()
	var new_scene = load("res://Menu.tscn")
	var menu = new_scene.instance()
	add_child(menu)
	move_child($Menu, 0)
	menu.connect("cube_2", self, "_on_Menu_cube_2")
	menu.connect("tesseract_3", self, "_on_Menu_tesseract_3")
	menu.connect("tesseract_2", self, "_on_Menu_tesseract_2")
	menu.connect("d_thing", self, "_on_Menu_d_thing")


func _on_Menu_cube_2(starting_configuration, minimum_moves, language):
	var new_scene = load("res://CubeGame2.tscn")
	var game = new_scene.instance()
	game.starting_configuration = starting_configuration
	game.minimum_moves = minimum_moves
	game.language = language
	add_child(game)
	game.connect("quit_to_title", self, "quit_to_title_handler")
	game.connect("send_game_data", self, "_on_send_game_data")
	self.get_child(0).queue_free()


func _on_Menu_d_thing(language):
	var new_scene = load("res://2dthing/Main.tscn")
	var game = new_scene.instance()
	game.language = language
	add_child(game)
	game.connect("quit_to_title", self, "quit_to_title_handler")
	self.get_child(0).queue_free()

func _on_Menu_tesseract_2(starting_configuration, minimum_moves, language):
	var new_scene = load("res://TesseractGame2.tscn")
	var game = new_scene.instance()
	game.starting_configuration = starting_configuration
	game.minimum_moves = minimum_moves
	game.language = language
	add_child(game)
	game.connect("quit_to_title", self, "quit_to_title_handler")
	game.connect("send_game_data", self, "_on_send_game_data")
	self.get_child(0).queue_free()
	
func _on_send_game_data(game_type, moves):
	
	var to_save = {
		'session_id': session_id,
		'game_type': game_type,
		'moves': moves
	}
	
	var file = File.new()
	file.open("res://PlayerData/save_data.txt", File.READ_WRITE)
	file.seek_end()
	file.store_line(to_json(to_save))
	file.close()

	#var data_to_send = "some_data"
	#var url = "some_url"
	#var json = JSON.stringify(data_to_send)
	#var headers = ["Content-Type: application/json"]
	#$HTTPRequest.request(url, headers, HTTPClient.METHOD_POST, json)
