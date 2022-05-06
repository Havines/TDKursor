extends Node2D


func _ready():
	for i in get_tree().get_nodes_in_group("BuildButtons"):
		i.connect("pressed", self, "activate_building_mode", [i.get_name()])

func activate_building_mode(but):
	$UI/AnimationPlayer.play_backwards("SlideBar_start")
	$UI/GUI._toggle_pressed()
	$buildingModeHandler.InitBuildingMode(but)


func _on_TextureButton_pressed():
	get_tree().change_scene("res://Scenes/MainLevelTwo/MainLevelTwo.tscn")
