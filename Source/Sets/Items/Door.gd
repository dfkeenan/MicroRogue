extends Node2D

export(bool) var closed : bool = true

onready var animation : AnimationPlayer = $ AnimationPlayer
onready var unlock_door : Interaction = $UnlockDoorInteraction

func _ready() -> void:
	GameState.connect("item_collected", self, "_on_item_collected")
	

func _on_item_collected(item:ItemData)->void:
	if item.type == "Key":
		unlock_door.enabled = true

func _on_UnlockDoorInteraction_interact() -> void:
	if closed and GameState.has_item("Key"):
		animation.play("Open")
		closed = false
