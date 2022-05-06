extends Node
signal scene_changer()
onready var anim = $AnimationPlayer
onready var color = $CanvasLayer/ColorRect
 
func _ready():
	pass 
func scene_changer(path):
	yield(get_tree().create_timer(0.5),"timeout")
	anim.play("start")
	yield(anim,"animation_finished")
	var res = get_tree().change_scene(path)
	assert(res==OK)
	anim.play_backwards("start")
	yield(anim,"animation_finished")
	emit_signal("scene_changer")
	
