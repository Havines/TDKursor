extends Node2D

var enemyArray = []
var built = false
var currEnemy
var ReadyToShoot = true
var SpeedDown = 0.75
export (float, 100.0, 800.0, 50.0) var TowerRange = 350.0
export (float, 1.0, 50.0, 1.0) var Damage = 5.0
export (float, 0.0, 5.0, 0.5) var ShootSecond = 2.0

func _ready():
	if built:
		$Range/CollisionShape2D.get_shape().radius = 0.5 * TowerRange
	

func _physics_process(delta):
	if enemyArray.size() != 0 and built:
		SelectNextEnemy()
		Turn()
		if ReadyToShoot:
			Shoot()
	else:
		currEnemy = null

func SelectNextEnemy():
	var enemyQuery = []
	for i in enemyArray:
		enemyQuery.append(i.offset)
	var maxOffset = enemyQuery.max()
	var enemyIndex = enemyQuery.find(maxOffset)
	currEnemy = enemyArray[enemyIndex]

func Shoot():
	ReadyToShoot = false
	$AnimationPlayer.play("Shooting")
	currEnemy.SetHP(Damage)
	currEnemy.Slowness()
	yield(get_tree().create_timer(ShootSecond), "timeout")
	ReadyToShoot = true

func Turn():
	$"Guns".look_at(currEnemy.position)

func _on_Range_area_entered(area):
	if area.is_in_group("enemies"):
		enemyArray.append(area.get_parent())

func _on_Range_area_exited(area):
	if area.is_in_group("enemies"):
		enemyArray.erase(area.get_parent())
