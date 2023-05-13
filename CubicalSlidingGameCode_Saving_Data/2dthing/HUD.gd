extends CanvasLayer

signal start_game
signal reset_game
signal undo_move
signal quit_to_title()

var movecount = 0

onready var language = self.get_parent().language

func _ready():
	update_score()
	
	if language == 0:
		$StartButton.text = "Spiel starten"
		$ResetButton.text = "Zum Anfang"
		$QuitButton.text= "Hauptmenü"
		$UndoButton.text = "Zug zurück"

func update_score():
	if language == 0:
		$MoveCounter.text ="Züge: "+ str(movecount)
	else:
		$MoveCounter.text = "Moves: " + str(movecount)

func _on_StartButton_pressed():
	emit_signal("start_game")
	$StartButton.visible = false
	movecount = 0

func _on_ResetButton_pressed():
	emit_signal("reset_game")
	movecount = 0

func _on_UndoButton_pressed():
	emit_signal("undo_move")
	
func _on_QuitButton_pressed():
	emit_signal("quit_to_title")
