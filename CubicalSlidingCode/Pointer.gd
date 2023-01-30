extends Spatial

var is_active = true

func activate():
	is_active = true
	
func deactivate():
	is_active = false
	
func start_timer():
	$Timer.start()

func _on_Timer_timeout():
	activate()
