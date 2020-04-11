extends Node2D

export(bool) var closed : bool = true

onready var animation : AnimationPlayer = $ AnimationPlayer
onready var tile_offset : Vector2 = $Sprite.offset

func _on_Area2D_body_entered(_body: Node) -> void:
	if closed and GameState.has_item("Key"):
		animation.play("Open")
		closed = false
