extends Control
class_name Hud

const ItemIconPrefab = preload("res://UI/ItemIcon.tscn")

onready var health_statbar : StatBar = $StatsContainer/VBoxContainer/HealthStatBar
onready var armour_statbar : StatBar = $StatsContainer/VBoxContainer/ArmourStatBar
onready var items_container : Container = $InventoryConainer/VBoxContainer/HBoxContainer


func _ready() -> void:
	GameState.connect("item_collected", self, "_on_item_collected")

func _on_item_collected(item:Item)->void:
	print("item collected")
	var icon:ItemIcon = ItemIconPrefab.instance()
	items_container.add_child(icon)
	icon.item_data = item
	
