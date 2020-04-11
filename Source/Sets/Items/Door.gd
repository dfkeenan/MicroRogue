extends Node2D

export(bool) var closed : bool = true

onready var animation : AnimationPlayer = $ AnimationPlayer

func _on_Interaction_interact() -> void:
	if closed and GameState.has_item("Key"):
		animation.play("Open")
		closed = false
