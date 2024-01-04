extends Control
class_name MainMenu

signal start_game()

@onready var buttons_v_box: VBoxContainer = %ButtonsVBox

# Called when the node enters the scene tree for the first time.
func _ready():
	focus_button()

func focus_button():
	if buttons_v_box:
		var button: Button = buttons_v_box.get_child(0)
		if button is Button:
			button.grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

func _on_start_game_button_pressed():
	start_game.emit()
	hide()

func _on_quit_button_pressed():
	get_tree().quit()

func _on_buttons_v_box_visibility_changed():
	if visible:
		focus_button()
