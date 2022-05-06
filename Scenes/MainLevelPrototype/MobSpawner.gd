extends Node

onready var map

export (int, 1, 10) var WaveCount = 5
export (int, 1, 10) var EnemyCountIncrease = 1

var currentWave = 0
var enemiesOnCurrWave = 0
var isWaveOngoing = false

func _ready():
	map = get_tree().get_nodes_in_group("Path")
	WaveCountUpdate()

func _process(delta):
	if DeathCounter.deaths == enemiesOnCurrWave and DeathCounter.deaths != 0:
		isWaveOngoing = false
		DeathCounter.deaths = 0
		$"../UI/AnimationPlayer".play("waveWin")
		if currentWave == 5:
			$"../UI/AnimationPlayer".play("win_panel")
			$"../UI/TextureButton".visible = false

func StartNextWave():
	var waveData = CreateWave()
	yield(get_tree().create_timer(0.2), "timeout")
	SpawnEnemies(waveData)
	if currentWave <= WaveCount:
		$TimerSpawn.start()

func CreateWave() -> Array:
	var enemies = []
	for i in enemiesOnCurrWave + EnemyCountIncrease:
		enemies.append(["EnemyTier1", i])
	currentWave += 1
	enemiesOnCurrWave += 1
	WaveCountUpdate()
	return enemies

func SpawnEnemies(waveData):
	for i in waveData:
		var enemy = load("res://Scenes/Enemies/" + i[0] + ".tscn").instance()
		if map.size() > 1:
			var mapInt = randi() % map.size()
			map[mapInt].add_child(enemy, true)
		else:
			map[0].add_child(enemy, true)
		yield(get_tree().create_timer(1.5), "timeout")


#func _on_TimerSpawn_timeout():
#	StartNextWave()

func WaveCountUpdate():
	$"../UI/Label".text = str("Wave: ", currentWave)


func _on_TextureButton_pressed():
	if DeathCounter.deaths == enemiesOnCurrWave:
		isWaveOngoing = false
	if isWaveOngoing:
		return 0
	isWaveOngoing = true
	StartNextWave()
