extends Area2D
class_name Interaction

signal interact()

var can_interact : bool = false

func _unhandled_input(event: InputEvent) -> void:
	if can_interact and event.is_action_pressed("player_action"):
		emit_signal("interact")


func _on_Interaction_body_entered(body: Node) -> void:
	can_interact = true


func _on_Interaction_body_shape_exited(body_id: int, body: Node, body_shape: int, area_shape: int) -> void:
	can_interact = false
