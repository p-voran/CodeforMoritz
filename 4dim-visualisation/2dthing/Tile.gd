extends Sprite

var tilelabel
var i_want_to_move

signal tile_wants_to_move(tilelabel)
signal tile_wants_not_to_move()

func _on_Button_pressed():
	if i_want_to_move:
		i_want_to_move = false
		emit_signal("tile_wants_not_to_move")
	else:
		i_want_to_move = true
		emit_signal("tile_wants_to_move",tilelabel)

func activate():
	$Button.visible = true

func deactivate():
	$Button.visible = false
