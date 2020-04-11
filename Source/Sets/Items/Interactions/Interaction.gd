extends Area2D
class_name Interaction

signal interact()

export(bool) var enabled : bool = true
export(String) var disabled_animation : String = "Disabled"
export(String) var enabled_animation : String = "Enabled"

onready var sprite : Sprite = $Sprite
onready var animation : AnimationPlayer = $AnimationPlayer

var can_interact : bool = false

func _ready() -> void:
	hide()

func _unhandled_input(event: InputEvent) -> void:
	if can_interact and event.is_action_pressed("player_action"):
		hide()
		emit_signal("interact")

func show() -> void:
	sprite.visible = true
	animation.play( enabled_animation if enabled else disabled_animation)
	
func hide() -> void:
	sprite.visible = false;
	animation.stop()

func _on_Interaction_body_entered(body: Node) -> void:
	can_interact = true
	show()

func _on_Interaction_body_shape_exited(body_id: int, body: Node, body_shape: int, area_shape: int) -> void:
	can_interact = false
	hide()
