extends Control

func _ready():
	$AnimationPlayer.play("Start")
	yield($AnimationPlayer, "animation_finished")
	$Credits.visible = false
	$AnimationPlayer.play("Title")

func _on_TextureButton_pressed():
	get_tree().change_scene("res://Scenes/MainLevelPrototype/Main.tscn")

func _on_TextureButton3_pressed():
	get_tree().quit()

func _on_TextureButton2_pressed():
	get_tree().change_scene("res://Scenes/Settings/Settings.tscn")
