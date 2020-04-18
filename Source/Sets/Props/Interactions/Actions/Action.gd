extends Node
class_name Action

signal action_complete()

func execute() -> void:
	return

func complete() -> void:
	emit_signal("action_complete")
