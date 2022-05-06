extends Node
signal updateMoney(value)
onready var map = $"../TileMap"

var buildMode = false 
var buildValid = false
var buildTile
var buildLocation
var buildObjectType

func InitBuildingMode(towerType):
	if buildMode:
		CancelBuildMode()
	buildObjectType = towerType
	buildMode = true
	$"../UI".SetBuildingMode(buildObjectType, $"../".get_global_mouse_position())

func _process(delta):
	if buildMode:
		UpdatePreviewMode()

func UpdatePreviewMode():
	var mousePosition = $"../".get_global_mouse_position()
	var currentTileOnMap = map.world_to_map(mousePosition)
	var titlePosition = map.map_to_world(currentTileOnMap)
	if map.get_cellv(currentTileOnMap) == 2:
		$"../UI".UpdateBuildingMode(titlePosition, Color.chartreuse)
		buildValid = true
		buildLocation = titlePosition
		buildTile = currentTileOnMap
	else:
		$"../UI".UpdateBuildingMode(titlePosition, Color.darkred)
		buildValid = false

func _input(event):
	if event.is_action_released("ui_accept") and buildMode:
		VerifyBuild()
		CancelBuildMode()
	if event.is_action_released("ui_cancel") and buildMode:
		CancelBuildMode()


func CancelBuildMode():
	buildValid = false
	buildMode = false
	$"../UI/ObjectPreview".free()

func VerifyBuild():
	if buildValid:
		if buildObjectType == "TowerTier1":
			if !Economy._buyTower(50):
				return 0
		if buildObjectType == "TowerTier2":
			if !Economy._buyTower(80):
				return 0
		if buildObjectType == "TowerTier3":
			if !Economy._buyTower(120):
				return 0
		if buildObjectType == "TowerTier4":
			if !Economy._buyTower(200):
				return 0
		var newObject = load("res://Scenes/Tower/" + buildObjectType + ".tscn").instance()
		newObject.position = buildLocation
		newObject.built = true
		map.get_node("Towers").add_child(newObject, true)
		map.set_cellv(buildTile, 0)
		emit_signal("updateMoney", Economy._getMoney())
func _ready():
	var gui = get_node("/root/Main/UI/GUI")
	connect("updateMoney", gui, "updateMoney")
