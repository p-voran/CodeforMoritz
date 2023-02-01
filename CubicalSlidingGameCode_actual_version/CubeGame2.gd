extends Spatial

#signals
signal quit_to_title()

#pre-set game variables
var d_cube = [[0, 0, 0], [0, 0, 1], [0, 1, 0], [0, 1, 1], [1, 0, 0], [1, 0, 1], [1, 1, 0], [1, 1, 1]]
var d_cube2 = [[0, 0, 0], [0, 0, 1], [0, 1, 1], [0, 1, 0], [1, 1, 0], [1, 1, 1], [1, 0, 1], [1, 0, 0]]
var facecollection = [[[1, 2, 3], [1, 4, 5], [2, 4, 6]], [[0, 2, 3], [0, 4, 5], [3, 5, 7]], [[0, 1, 3], [3, 6, 7], [0, 4, 6]], [[0, 1, 2], [2, 6, 7], [1, 5, 7]], [[5, 6, 7], [0, 1, 5], [0, 2, 6]], [[4, 6, 7], [0, 1, 4], [1, 3, 7]], [[4, 5, 7], [2, 3, 7], [0, 2, 4]], [[4, 5, 6], [2, 3, 6], [1, 3, 5]]]
var starting_configuration = [3,1,2,0,4,0,0,0]
var goal_configuration = [1,2,3,0,4,0,0,0]
var tokenlist = [0,0,0,0]
var cornerlist =[0,0,0,0,0,0,0,0]
var minimum_moves = 6

#changing game variables
onready var current_configuration = [] + starting_configuration
onready var progress_array = [[] + starting_configuration]
var movecounter = 0
var moving_token = 0

var pointer_pos = [0,0,0]

#camera variables
var phi = 0
var theta = PI/2
var cam_radius = 10
var cam_speed = 1
var controler_cam_speed = 0.05


func create_game():
	#Create the corners
	var cornerlistcounter = 0
	for coordinates in d_cube:
		var scene = load("res://Corner.tscn")
		var corner = scene.instance()
		set_position(corner, coordinates)
		add_child(corner, true)
		cornerlist[cornerlistcounter] = corner.get_index()
		corner.cornerindex = cornerlistcounter
		corner.connect("corner_clicked", self, "corner_clicked_handler")
		#make their materials unique
		corner.get_node("MeshInstance").set_surface_material(0, corner.get_node("MeshInstance").get_surface_material(0).duplicate())
		#set color to match goal configuration
		var goal_label = goal_configuration[cornerlistcounter]
		if goal_label != 0:
			var mat = load("res://Materials/Material"+ str(goal_label) +".tres")
			var temp_corner_color = mat.get_albedo()
			corner.get_node("MeshInstance").get_surface_material(0).set_albedo(temp_corner_color)
		
		cornerlistcounter += 1
	#create the tiles
	for item in starting_configuration:
		if item != 0:
			var scene = load("res://NewToken.tscn")
			var token = scene.instance()
			var coordinates = d_cube[starting_configuration.find(item)]
			set_position(token, coordinates)
			token.tokenlabel = item 
			add_child(token, true)
			tokenlist[item-1] = token.get_index()
			var mat = load("res://Materials/Material"+str(item)+".tres")
			token.get_node("Torus").material = mat
			token.get_node("Torus").get_node("SubTorus1").material = mat
			token.get_node("Torus").get_node("SubTorus2").material = mat
			token.connect("token_wants_to_move", self, "token_wants_to_move_handler")
			token.connect("token_wants_not_to_move", self, "token_wants_not_to_move_handler")
		
	$Control/WinMessage.text = "Well done ! But can you do it in only " + str(minimum_moves) + " slides?"
	
	set_position($Pointer, pointer_pos)
	
	#draw the cube
	var scene = load("res://LineRenderer.tscn")
	var line= scene.instance()
	line.points.clear()
	for item in d_cube2:
		var new_position1=[]
		var new_position2=[]
		for item2 in d_cube2:
			if pow(item[0]-item2[0],2)+pow(item[1]-item2[1],2)+pow(item[2]-item2[2],2)==1:
				new_position1 = calc_position(item)
				new_position2 = calc_position(item2)
				line.points.append(Vector3(new_position1[0],new_position1[1],new_position1[2]))
				line.points.append(Vector3(new_position2[0],new_position2[1],new_position2[2]))	
		line.points.append(Vector3(new_position1[0],new_position1[1],new_position1[2]))

#set postition of object to the position inidcated by the arr containing the coordinates in the cube
func set_position(object, arr):
	var new_position =calc_position(arr)
	object.translation.x = new_position[0] 
	object.translation.y = new_position[1] 
	object.translation.z = new_position[2] 
	
func calc_position(arr):
	var position_parameter = 4
	var result=[0,0,0]
	result[0] = arr[0] * position_parameter - 0.5 * position_parameter
	result[1] = arr[1] * position_parameter - 0.5 * position_parameter
	result[2] = arr[2] * position_parameter - 0.5 * position_parameter
	return result

func get_right(arr):
	if arr == [0,0]:
		return [1,0]
	if arr == [1,0]:
		return [1,1]
	if arr == [1,1]:
		return [0,1]
	if arr == [0,1]:
		return [0,0]
	
func get_left(arr):
	if arr == [0,0]:
		return [0,1]
	if arr == [1,0]:
		return [0,0]
	if arr == [1,1]:
		return [1,0]
	if arr == [0,1]:
		return [1,1]
		
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

func adjust_game_state_to_config(config, movecount):
	current_configuration = [] + config
	for label in config:
		if label != 0:
			var coordinates = d_cube[config.find(label)]
			set_position(self.get_child(tokenlist[label-1]), coordinates)
			self.get_child(tokenlist[label-1]).activate()
	for i in cornerlist:
		self.get_child(i).deactivate()
	#adjust movecounter
	movecounter = movecount
	$Control/MoveCounter.text = "Moves: "+ str(movecounter)

# Called when the node enters the scene tree for the first time.
func _ready():
	create_game()

func token_wants_to_move_handler(tokenlabel):
	moving_token = tokenlabel
	var possible_slides = calculate_possible_slides(current_configuration, tokenlabel)
	#get the color of the moving_token
	var temp_token_color = self.get_child(tokenlist[tokenlabel - 1]).get_node("Torus").material.get_albedo()
	
	for i in cornerlist:
		get_child(i).deactivate()
	if possible_slides.size() > 0:

		#we have to activate the right corners here!
		get_child(cornerlist[current_configuration.find(moving_token)]).activate(temp_token_color)
		for i in possible_slides:
			get_child(cornerlist[i]).activate(temp_token_color)
		#deactivate all tokens but the moving one
		#for label in current_configuration:
		#	if label != 0 && label != tokenlabel:
		#		get_child(tokenlist[label-1]).deactivate()

#cancel movement
func token_wants_not_to_move_handler():
	for i in cornerlist:
		get_child(i).deactivate()
	for i in tokenlist:
		get_child(i).activate()

#do a slide
func corner_clicked_handler(cornerindex):
	current_configuration[current_configuration.find(moving_token)] = 0
	current_configuration[cornerindex] = moving_token
	var coordinates = d_cube[cornerindex]
	movecounter += 1
	get_child(tokenlist[moving_token-1]).i_want_to_move = false
	adjust_game_state_to_config(current_configuration, movecounter)
	progress_array.append([]+current_configuration)
	
	#Win Condition
	if current_configuration == goal_configuration:
		for i in cornerlist:
			self.get_child(i).deactivate()
		for i in tokenlist:
			self.get_child(i).deactivate()
		#$Control/ResetButton.hide()
		$Control/UndoButton.hide()
		if movecounter == minimum_moves:
			$Control/WinMessage.text = "Congratulations, you solved it the fastest way possible!"
		$Control/WinMessage.show()
	

# handles Camera stuff

func _process(delta):
	if Input.is_action_pressed("ui_left"):
		phi += delta * cam_speed
	if Input.is_action_pressed("ui_right"):
		phi -= delta * cam_speed
	if Input.is_action_pressed("ui_up"):
		theta -= delta * cam_speed
	if Input.is_action_pressed("ui_down"):
		theta += delta * cam_speed
	theta = clamp(theta, PI/16, 15 * (PI/16))
	# y ist nach oben
	$Camera.translation.x = cam_radius * sin(theta) * cos(phi)
	$Camera.translation.y = cam_radius * cos(theta)
	$Camera.translation.z = cam_radius * sin(theta) * sin(phi)
	$Camera.look_at(Vector3.ZERO, Vector3.UP)
	
	
	#controler stuff
	phi -= Input.get_axis("c_right_stick_left", "c_right_stick_right") * controler_cam_speed
	theta += Input.get_axis("c_right_stick_up", "c_right_stick_down") * controler_cam_speed
	
	# move pointer 
	if $Pointer.is_active:
		if Input.get_vector("move_left", "move_right", "move_forward", "move_back") != Vector2.ZERO:
			if Input.get_axis("move_back", "move_forward") < -0.1:
				pointer_pos[1] = 0
			if Input.get_axis("move_back", "move_forward") > 0.1:
				pointer_pos[1] = 1
			if Input.get_axis( "move_left", "move_right") <  -0.1:
				var a_temp = get_right([pointer_pos[0], pointer_pos[2]])[0]
				var b_temp = get_right([pointer_pos[0], pointer_pos[2]])[1]
				pointer_pos[0] = a_temp
				pointer_pos[2] = b_temp
			if Input.get_axis( "move_left", "move_right") > 0.1:
				var a_temp = get_left([pointer_pos[0], pointer_pos[2]])[0]
				var b_temp = get_left([pointer_pos[0], pointer_pos[2]])[1]
				pointer_pos[0] = a_temp
				pointer_pos[2] = b_temp
			set_position($Pointer, pointer_pos)
			$Pointer.deactivate()
			$Pointer.start_timer()
	
	#click tokens and corners
	if Input.is_action_just_pressed("A_button"):
		var is_here_no_token = true
		for i in current_configuration:
			if i != 0:
				if d_cube[current_configuration.find(i)] == pointer_pos:
					get_child(tokenlist[i-1]).on_cont_a_button()
					is_here_no_token = false
		if is_here_no_token:
			get_child(cornerlist[d_cube.find(pointer_pos)]).on_cont_a_button()
		
	#click menu options
	if Input.is_action_just_pressed("B_button"):
		_on_UndoButton_pressed()
	if Input.is_action_just_pressed("X_button"):
		_on_ResetButton_pressed()
	if Input.is_action_just_pressed("Y_button"):
		_on_QuitButton_pressed()
	

#enables mouse control on camera
var prev_mouse_pos
var next_mouse_pos
var rotating = false

func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if not rotating and event.pressed:
			rotating=true
			prev_mouse_pos=get_viewport().get_mouse_position()
		if rotating and not event.pressed:
			rotating=false
	if event is InputEventMouseMotion and rotating:
		next_mouse_pos = get_viewport().get_mouse_position()
		phi+=(next_mouse_pos.x-prev_mouse_pos.x)*.01
		theta-=(next_mouse_pos.y-prev_mouse_pos.y)*.01
		prev_mouse_pos=next_mouse_pos
	
	
func _on_UndoButton_pressed():
	if movecounter > 0:
		progress_array.pop_back()
		adjust_game_state_to_config(progress_array[-1], movecounter-1)
	
func _on_ResetButton_pressed():
	adjust_game_state_to_config(starting_configuration, 0)
	progress_array = [[] + starting_configuration]
	
	$Control/UndoButton.show()
	$Control/WinMessage.hide()
	$Control/WinMessage.text = "Well done ! But can you do it in only " + str(minimum_moves) + " slides?"

func _on_QuitButton_pressed():
	emit_signal("quit_to_title")
