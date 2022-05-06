extends CanvasLayer


func SetBuildingMode(Type, MousePosition):
	var drag_obj = load("res://Scenes/Tower/" + Type + ".tscn").instance()
	drag_obj.set_name("DragObj")
	drag_obj.modulate = Color.chartreuse
	
	var rangeTexture = Sprite.new()
	rangeTexture.position = Vector2(32, 32)
	var scaling = drag_obj.TowerRange / 300.0
	rangeTexture.scale = Vector2(scaling, scaling)
	var texture = load("res://Assets/Sprites/UI/RangeTower.png")
	rangeTexture.texture = texture
	rangeTexture.modulate = Color.chartreuse
	
	var control = Control.new()
	control.add_child(drag_obj, true)
	control.add_child(rangeTexture, true)
	control.rect_position = MousePosition
	control.set_name("ObjectPreview")
	add_child(control, true)
	move_child(get_node("ObjectPreview"), 0)


func UpdateBuildingMode(position, color):
	get_node("ObjectPreview").rect_position = position
	if get_node("ObjectPreview/DragObj").modulate != Color(color):
		get_node("ObjectPreview/DragObj").modulate = Color(color)
		get_node("ObjectPreview/Sprite").modulate = Color(color)
