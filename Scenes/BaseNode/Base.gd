extends Node2D


func _ready():
	pass


func _on_Zone_body_entered(body):
	if body.is_in_group("enemies"):
		get_tree().quit()
