extends Control
var can_play_anim = true

signal _ToggleButPressed()

func _ready():
	var GUI = get_node("/root/Main/UI/GUI")
	connect("_ToggleButPressed", GUI, "_toggle_pressed")

func _on_ToggleButton_gui_input(event):
	if can_play_anim == true:
		var anim = get_node("/root/Main/UI/AnimationPlayer")
		if event is InputEventMouseButton:
			if event.is_pressed():
				emit_signal("_ToggleButPressed")
				if $"../../../".rect_min_size.y == 70:
					anim.play("SlideBar_start")
				if $"../../../".rect_min_size.y == 1080:
					anim.play_backwards("SlideBar_start")


func _on_AnimationPlayer_animation_started(anim_name):
	can_play_anim = false


func _on_AnimationPlayer_animation_finished(anim_name):
	can_play_anim = true
