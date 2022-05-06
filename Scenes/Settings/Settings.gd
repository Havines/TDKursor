extends Control



func _on_TextureButton_toggled(button_pressed):
		OS.window_fullscreen = !OS.window_fullscreen


func _on_TextureButton2_pressed():
	get_tree().change_scene("res://Scenes/Menu/Menu.tscn")
