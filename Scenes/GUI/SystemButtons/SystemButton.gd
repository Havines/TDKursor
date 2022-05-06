extends Control

enum TYPES {EMPTY, CLOSED, MINIMIZED, MAXIMIZED}
export (TYPES) var Type = TYPES.EMPTY
export (StreamTexture) var icon = preload("res://Assets/Sprites/UI/Icons/x.svg")

func _ready():
	$Panel/X.texture = icon

func _on_QuitBtn_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if Type == TYPES.CLOSED:
				get_tree().paused = false
				get_tree().change_scene("res://Scenes/Menu/Menu.tscn")
			elif Type == TYPES.MAXIMIZED:
				OS.window_fullscreen = !OS.window_fullscreen
			elif Type == TYPES.MINIMIZED:
				OS.window_minimized = true

func _on_QuitBtn_mouse_entered():
	if Type == TYPES.CLOSED:
		$Panel.modulate = "#d94242"
	else:
		$Panel.modulate = "#8b6648"


func _on_QuitBtn_mouse_exited():
	$Panel.modulate = "#ffffff"
