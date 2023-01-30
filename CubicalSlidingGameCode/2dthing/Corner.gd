extends Sprite

var coordinates 
var index
var moving_label = 0

signal tile_can_move_here(tilelabel, index)

func activate(tilelabel):
	moving_label = tilelabel
	$Button.visible = true

func deactivate():
	$Button.visible = false
	moving_label = 0

func _on_Button_pressed():
	emit_signal("tile_can_move_here", moving_label, index)
