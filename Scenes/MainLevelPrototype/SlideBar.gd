extends Panel

onready var anim = $"../../AnimationPlayer"
var Opened = false


func _on_ToggleButton_gui_input(event):
	if event is InputEventMouseButton:
		if event.get_button_index() == 1:
			if rect_min_size.y == 70 and event.is_pressed():
				Opened = true
				anim.play("SlideBar_start")
			if rect_min_size.y == 1080 and event.is_pressed():
				Opened = false
				anim.play_backwards("SlideBar_start")


func _on_Towers_mouse_entered():
	if Opened:
		if rect_min_size.x == 100:
			anim.play("SlideBar_iconsDetect")

func _on_Towers_mouse_exited():
	if Opened:
		if rect_min_size.x == 270:
			anim.play_backwards("SlideBar_iconsDetect")
