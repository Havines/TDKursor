extends Panel

export (String) var NextLevelPath


func _on_TextureButton_pressed():
	get_tree().change_scene(NextLevelPath)
	Economy._setTotalMoney(500)
