extends HBoxContainer

onready var anim = $"../AnimationPlayer"
var Opened = false

func _ready():
	pass

func _toggle_pressed():
	Opened = !Opened
	var topBarV = $Body/TopBar
	var towersV = $SlideBar/VBoxContainer/TopContent/Towers
	var pages = get_tree().get_nodes_in_group("Page")
	get_tree().paused = !get_tree().paused
	topBarV.visible = !topBarV.visible
	towersV.visible = !towersV.visible
	for page in pages:
		if page.visible:
			page.visible = false

func updateMoney(value):
	$SlideBar/VBoxContainer/BottomContent/Money/Label.text = str(value)
