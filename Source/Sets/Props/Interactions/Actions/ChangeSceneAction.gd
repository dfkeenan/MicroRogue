extends Action
class_name ChangeSceneAction

func execute() -> void:
	$TransitionLayer.transition_out()
	yield($TransitionLayer,"transition_complete")
	get_tree().reload_current_scene()
	complete()
