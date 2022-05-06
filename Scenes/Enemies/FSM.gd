extends "res://Data/StateMachine/StateMachine.gd"

func _ready():
	_initState()
	call_deferred("set_state", states.default)
	
func _initState():
	add_state("default")
	add_state("burn")
	add_state("slow")
	
func _state_logic(delta):
	parent._move(delta)
	

func _get_transition(delta):
	match state:
		states.default:
			if parent.isBurning:
				return states.burn
			if parent.isSlow:
				return states.slow
		states.burn:
			if !parent.isBurning and !parent.isSlow:
				return states.default
		states.slow:
			if  !parent.isBurning and !parent.isSlow:
				return states.default
	return null

func _enter_state(new_state, old_state):
	match new_state:
		states.burn:
			parent.TimerEffect.stop()
			parent.TimerEffect.start()
			parent.SpeedModificator = 1.35
			parent.modulate = Color.orangered
			parent.get_node("Particles2D").emitting = true
			parent.Burning()
		states.slow:
			parent.TimerEffect.stop()
			parent.TimerEffect.start()
			parent.SpeedModificator = 0.3

func _exit_state(old_state, new_state):
	match old_state:
		states.burn:
			parent.SpeedModificator = 1.0
			parent.modulate = Color.white
			parent.get_node("Particles2D").emitting = false
		states.slow:
			parent.SpeedModificator = 1.0
	
