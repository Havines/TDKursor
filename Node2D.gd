extends Node2D

func _ready():
	pass

func StartAnim(dmg):
	$Label.text = str(dmg)
	$AnimationPlayer.play("dmgNumbers")

func _free():
	queue_free()
