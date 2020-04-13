tool
extends CanvasLayer
class_name TransitionLayer

enum TransitionCompletionAction { NOTHING, REMOVE }
enum TransitionReadyAction { NOTHING, TRANSITION_IN, TRANSITION_OUT }

export(float,0,1.0) var cutoff : float setget set_cutoff

export(TransitionCompletionAction) var after_transtion_in := TransitionCompletionAction.NOTHING
export(TransitionCompletionAction) var after_transtion_out := TransitionCompletionAction.NOTHING
export(TransitionReadyAction) var ready_action := TransitionReadyAction.NOTHING

export(Resource) var default_transition setget set_default_transition


signal transition_complete

# Called when the node enters the scene tree for the first time.
func _ready():
	self.cutoff = cutoff
	if not Engine.editor_hint:
		match ready_action:
			TransitionReadyAction.TRANSITION_IN:
				transition_in()
			TransitionReadyAction.TRANSITION_OUT:
				transition_out()

func set_cutoff(value : float) -> void:
	cutoff = value
	if $ColorRect:
		$ColorRect.material.set("shader_param/cutoff",value)

func set_default_transition(value : Resource) -> void:
	if (not value) or value is Transition:
		default_transition = value
	
	
func transition_in(transition: Transition=null) -> void:	
	$Tween.stop_all()
	self.cutoff = 1
	$ColorRect.visible = true
	var transition_duration = _set_shader_transition(transition, true)
	$Tween.interpolate_method(self,"set_cutoff", 1,0,transition_duration,Tween.TRANS_LINEAR,Tween.EASE_IN)
	$Tween.start()
	yield($Tween,"tween_completed")
	$ColorRect.visible = false
	emit_signal("transition_complete")
	if after_transtion_in == TransitionCompletionAction.REMOVE:
		queue_free()
	
func transition_out(transition : Transition=null) -> void:	
	$Tween.stop_all()
	self.cutoff = 0
	$ColorRect.visible = true
	var transition_duration = _set_shader_transition(transition, false)
	$Tween.interpolate_method(self,"set_cutoff", 0,1,transition_duration,Tween.TRANS_LINEAR,Tween.EASE_IN)
	$Tween.start()
	yield($Tween,"tween_completed")
	emit_signal("transition_complete")
	if after_transtion_out == TransitionCompletionAction.REMOVE:
		queue_free()
	

func _set_shader_transition(transition : Transition, is_in : bool) -> float:
	var new_transition = transition
	
	if not new_transition:
		new_transition = default_transition
		
	if not new_transition:
		print("no transition")
		return 1.0
		
	var material : ShaderMaterial = $ColorRect.material
	
	material.set("shader_param/transition_map", new_transition.transition_map)
	material.set("shader_param/transition_color", new_transition.transition_color)
	
	var options = new_transition.transition_in_option if is_in else new_transition.transition_out_option
	
	material.set("shader_param/invert", options & Transition.TransitionOption.INVERT != 0)
	material.set("shader_param/flip_x", options & Transition.TransitionOption.FLIP_X != 0)
	material.set("shader_param/flip_y", options & Transition.TransitionOption.FLIP_Y != 0)
	
	return new_transition.duration
	
func _get_configuration_warning():
	var warnings = PoolStringArray()
	if not default_transition:
		warnings.append("%s is missing a default transition." % name)
	
	elif not default_transition is Transition:
		warnings.append("% is has invalid a default transition." % name)
		
	return warnings.join("\n")
