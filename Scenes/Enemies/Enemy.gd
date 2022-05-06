extends PathFollow2D

signal updateMoney(value)
export(float, 50.0, 200.0, 10.0) var Speed = 50.0
var health = 100.0 setget SetHP
var max_health = 100.0
var SlowTime = 1.0
var SlowedTime = []
var isBurning = false
var isSlow = false
var SpeedModificator = 1.0
var dmgnum = preload("res://Scenes/GUI/DMGNuvberSystem/Oleg.tscn")

onready var TimerEffect = $"TimerEffects"

func _ready():
	var gui = get_node("/root/Main/UI/GUI")
	connect("updateMoney", gui, "updateMoney")
	pass


func _move(delta):
	offset += Speed * SpeedModificator * delta


func SetHP(value):
	health -= value
	var lbl = dmgnum.instance()
	lbl.position = $Position2D.position
	add_child(lbl)
	lbl.StartAnim(value)
	if health <= 0:
		Death()

func Burn():
	isBurning = true
	
func Slowness():
	isSlow = true

func Death():
	Economy._setMoney(10)
	emit_signal("updateMoney", Economy._getMoney())
	DeathCounter.deaths += 1
	self.queue_free()

func Burning():
	while(isBurning):
		yield(get_tree().create_timer(0.2), "timeout")
		SetHP(1)

func _on_TimerEffects_timeout():
	isBurning = false
	isSlow = false
	print(222)
