extends Node

var ActiveEffect setget SetActiveEffect, GetActiveEffect
var TimeOut = 0
var TimeIn = 0

func _ready():
	TimeIn = 1000
	TimeOut = 2000


func SetActiveEffect(effect):
	if (effect != null):
		ActiveEffect = effect

func GetActiveEffect():
	return ActiveEffect


func _physics_process(delta):
	pass

