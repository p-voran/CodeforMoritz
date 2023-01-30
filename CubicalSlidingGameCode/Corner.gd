extends Spatial

var cornerindex
var activated = false
signal corner_clicked(cornerindex)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func activate(tokencolor):
	activated = true
	var mat = self.get_child(0).get_surface_material(0)
	mat.emission_enabled = true
	if mat.get_albedo() != Color(0.784314, 0.784314, 0.784314):
		mat.set_emission(mat.albedo_color)
	else:
		mat.set_emission(tokencolor)

func deactivate():
	activated = false
	var mat = self.get_child(0).get_surface_material(0)
	mat.emission_enabled = false

func _on_Area_input_event(_camera, event, _position, _normal, _shape_idx):
	if activated:
		if event is InputEventMouseButton:
			if event.button_index == BUTTON_LEFT and event.pressed == true:
				emit_signal("corner_clicked", cornerindex)

func on_cont_a_button():
	if activated:
		emit_signal("corner_clicked", cornerindex)
