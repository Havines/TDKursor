extends Node

onready var money = 500

func _ready():
	pass

func _buyTower(value) -> bool:
	if money > value - 1:
		money -= value
		return true
	else:
		return false

func _setMoney(value):
	money += value
	
func _setTotalMoney(value):
	money = value

func _getMoney():
	return money
