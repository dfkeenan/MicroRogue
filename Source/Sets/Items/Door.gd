extends Node2D


onready var collision_layer = $StaticBody2D.collision_layer

#func _ready() -> void:
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_Area2D_body_entered(_body: Node) -> void:
	if GameState.has_item("Key"):
		$Sprite.visible = false
		$StaticBody2D.collision_layer = 0
