extends Control

onready var anim = get_tree().get_nodes_in_group("UIAnimPlayer")[0]
export (StreamTexture) var icon = preload("res://Assets/Sprites/UI/Icons/home.svg")
export var text = "..."
export (NodePath) var page

func _ready():
	$icon.texture = icon
	$Label.text = text

func _process(delta):
	if get_node("/root/Main/MobSpawner").isWaveOngoing:
		$"noSign".visible = true
	else:
		$"noSign".visible = false

func _on_UI_Item_mouse_entered():
	$ColorRect.visible = true
	if $"../../../../".Opened:
		if $"../../../../SlideBar".rect_min_size.x == 100:
			anim.queue("SlideBar_iconsDetect")

func _on_UI_Item_mouse_exited():
	$ColorRect.visible = false
	if $"../../../../".Opened:
		if $"../../../../SlideBar".rect_min_size.x == 270:
			anim.play_backwards("SlideBar_iconsDetect")

func _on_UI_Item_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and !get_node("/root/Main/MobSpawner").isWaveOngoing:
			get_node(page).visible = !get_node(page).visible
