extends Spatial

var tokenlabel
var i_want_to_move = false
var activated = true

signal token_wants_to_move(tokenlabel)
signal token_wants_not_to_move()


func activate():
	activated = true

func deactivate():
	activated = false

func _on_Area_input_event(_camera, event, _position, _normal, _shape_idx):
	if activated:
		if event is InputEventMouseButton:
			if event.button_index == BUTTON_LEFT and event.pressed == true:
				if i_want_to_move:
					i_want_to_move = false
					emit_signal("token_wants_not_to_move")
				else:
					i_want_to_move = true
					emit_signal("token_wants_to_move", tokenlabel)

func on_cont_a_button():
	if activated:
		if i_want_to_move:
			i_want_to_move = false
			emit_signal("token_wants_not_to_move")
		else:
			i_want_to_move = true
			emit_signal("token_wants_to_move", tokenlabel)
