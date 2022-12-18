extends Node

var facecollection = [[[1, 2, 3], [1, 4, 5], [2, 4, 6]], [[0, 2, 3], [0, 4, 5], [3, 5, 7]], [[0, 1, 3], [3, 6, 7], [0, 4, 6]], [[0, 1, 2], [2, 6, 7], [1, 5, 7]], [[5, 6, 7], [0, 1, 5], [0, 2, 6]], [[4, 6, 7], [0, 1, 4], [1, 3, 7]], [[4, 5, 7], [2, 3, 7], [0, 2, 4]], [[4, 5, 6], [2, 3, 6], [1, 3, 5]]]
var d_cube = [[0, 0, 0], [0, 0, 1], [0, 1, 0], [0, 1, 1], [1, 0, 0], [1, 0, 1], [1, 1, 0], [1, 1, 1]]
var tilelist = [0,0,0,0]
var cornerlist = [0,0,0,0,0,0,0,0]

#2 dim array saving the progress of the game
var progress_array = []

var starting_configuration = [2,3,1,0,4,0,0,0]
var start_depth_10 = [0, 3, 2, 1, 4, 0, 0, 0]
var current_configuration = [2,3,1,0,4,0,0,0]
var goal_configration = [1,2,3,0,4,0,0,0]
var min_moves = 6


#	adjust_game_state_to_config(start_depth_10,0) 

func calculate_possible_slides(configuration, label):
	var res = []
	if label != 0:
		#iterate over all faces the labeled tile is in
		var vertex = configuration.find(label)
		for k_face in facecollection[vertex]:
			var b = true
			for corner in k_face:
				if configuration[corner] != 0:
					b = false
					break
			#if face is empty add newconfigurations
			if b:
				#add the 2**k-1 slides possible on that k_face
				for corner in k_face:
					res.append(corner)
	return res

func adjust_position_to_coordinates(to_adjust,  coordinates):
	to_adjust.position.x = 50 + (3 * coordinates[0] + coordinates[2] * (coordinates[2] - 2 * coordinates[0])) * 150
	to_adjust.position.y = 50 + (3 * coordinates[1] + coordinates[2] * (coordinates[2] - 2 * coordinates[1])) * 150

func create_new_game():
	print("Hi")
	$HUD/ResetButton.show()
	$HUD/WinMessage.hide()
	$HUD/WinMessage.text = "Well Done! \n But can you do it in only " + str(min_moves) +" moves?"
	progress_array = [[] + starting_configuration]
	$HUD/UndoButton.hide()
	$HUD.movecount = 0
	$HUD.update_score()
	
	#create the corners
	var cornerlistcounter = 0
	current_configuration = [] + starting_configuration
	for item in d_cube:
		var scene = load("res://2dthing/Corner.tscn")
		var corner = scene.instance()
		corner.name = corner.name + str(d_cube.find(item))
		corner.coordinates = item
		corner.index = d_cube.find(item)
		corner.position.x = 50 + (3 * item[0] + item[2] * (item[2] - 2 * item[0])) * 150
		corner.position.y = 50 + (3 * item[1] + item[2] * (item[2] - 2 * item[1])) * 150
		add_child(corner, true)
		cornerlist[cornerlistcounter] = corner.get_index()
		if cornerlistcounter < 3:
			var new_tex = load("res://2dthing/Art/UsedButtons/Color" + str(cornerlistcounter+1) +".png")
			corner.set_texture(new_tex)
		if cornerlistcounter == 4:
			var new_tex = load("res://2dthing/Art/UsedButtons/Color4.png")
			corner.set_texture(new_tex)
		corner.connect("tile_can_move_here", self, "do_a_slide")
		cornerlistcounter += 1

	#create the tiles
	for item in starting_configuration:
		if item != 0:
			var scene = load("res://2dthing/Tile.tscn")
			var tile = scene.instance()
			tile.tilelabel = item
			tile.name = tile.name + str(item)
			var coordinates = d_cube[starting_configuration.find(item)]
			tile.position.x = 50 + (3 * coordinates[0] + coordinates[2] * (coordinates[2] - 2 * coordinates[0])) * 150
			tile.position.y = 50 + (3 * coordinates[1] + coordinates[2] * (coordinates[2] - 2 * coordinates[1])) * 150
			add_child(tile, true)
			tilelist[item-1] = tile.get_index()
			var new_tex = load("res://2dthing/Art/UsedButtons/Color" + str(item) +".png")
			tile.set_texture(new_tex)
			tile.connect("tile_wants_to_move", self, "tile_wants_to_move_handler")
			tile.connect("tile_wants_not_to_move", self, "tile_wants_not_to_move_handler")
			

func tile_wants_to_move_handler(tilelabel):
	var possible_slides = calculate_possible_slides(current_configuration, tilelabel)
	if possible_slides.size() > 0:
		#we have to activate the right corners here!
		for i in possible_slides:
			get_child(cornerlist[i]).activate(tilelabel)
		#deactivate all tiles but the moving one
		for label in current_configuration:
			if label != 0 && label != tilelabel:
				get_child(tilelist[label-1]).deactivate()

func tile_wants_not_to_move_handler():
	#deactivate all corners
	for i in cornerlist:
		self.get_child(i).deactivate()
	#activate all tiles
	for i in tilelist:
		self.get_child(i).activate()

func do_a_slide(tilelabel, cornerindex):
	current_configuration[current_configuration.find(tilelabel)] = 0
	current_configuration[cornerindex] = tilelabel
	var coordinates = d_cube[cornerindex]
	self.get_child(tilelist[tilelabel-1]).position.x = 50 + (3 * coordinates[0] + coordinates[2] * (coordinates[2] - 2 * coordinates[0])) * 150
	self.get_child(tilelist[tilelabel-1]).position.y = 50 + (3 * coordinates[1] + coordinates[2] * (coordinates[2] - 2 * coordinates[1])) * 150
	#deactivate all corners
	for i in cornerlist:
		self.get_child(i).deactivate()
	#activate all tiles
	for i in tilelist:
		self.get_child(i).activate()
		self.get_child(i).i_want_to_move = false
	$HUD.movecount += 1
	$HUD.update_score()
	
	progress_array.append([] + current_configuration)
	$HUD/UndoButton.show()
	
	#Game completed!
	if current_configuration == goal_configration:
		for i in cornerlist:
			self.get_child(i).deactivate()
		for i in tilelist:
			self.get_child(i).deactivate()
		$HUD/StartButton.show()
		$HUD/ResetButton.hide()
		$HUD/UndoButton.hide()
		if $HUD.movecount == 6:
			$HUD/WinMessage.text = "Congratulation, you solved it the fasted way possible!"
		$HUD/WinMessage.show()
		

func adjust_game_state_to_config(config, movecount):
	current_configuration = [] + config
	for label in config:
		if label != 0:
			var coordinates = d_cube[config.find(label)]
			adjust_position_to_coordinates(self.get_child(tilelist[label-1]), coordinates)
			self.get_child(tilelist[label-1]).activate()
	for i in cornerlist:
		self.get_child(i).deactivate()

	$HUD.movecount = movecount
	$HUD.update_score()

func _on_HUD_start_game():
	create_new_game()

func _on_HUD_reset_game():
	adjust_game_state_to_config(starting_configuration, 0)
	progress_array = [[]+starting_configuration]
	$HUD/UndoButton.hide()

func _on_HUD_undo_move():
	adjust_game_state_to_config(progress_array[-2], $HUD.movecount - 1)
	progress_array.pop_back()
	if progress_array.size() == 1:
		$HUD/UndoButton.hide()
