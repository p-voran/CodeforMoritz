extends CanvasLayer

signal start_game
signal reset_game
signal undo_move

var movecount = 0

func _ready():
	update_score()

func update_score():
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
