extends Area2D
class_name Interaction

signal interact()

export(bool) var enabled : bool = true
export(String) var disabled_animation : String = "Disabled"
export(String) var enabled_animation : String = "Enabled"

onready var sprite : Sprite = $Sprite
onready var animation : AnimationPlayer = $AnimationPlayer

var interactable : bool = true
var handle_input : bool = false

func _ready() -> void:
	hide()

func _unhandled_input(event: InputEvent) -> void:
	if handle_input and event.is_action_pressed("player_action"):
		hide()
		emit_signal("interact")
		execute_actions()

func show() -> void:
	if interactable:
		sprite.visible = true
		animation.play( enabled_animation if enabled else disabled_animation)
	
func hide() -> void:
	sprite.visible = false;
	animation.stop()
	
func execute_actions() -> void:
	for child in get_children():
		if child is Action:
			child.execute()
			yield(child,"action_complete")

func _on_Interaction_body_entered(_body: Node) -> void:
	handle_input = true
	show()

func _on_Interaction_body_shape_exited(_body_id: int, _body: Node, _body_shape: int, _area_shape: int) -> void:
	handle_input = false
	hide()
