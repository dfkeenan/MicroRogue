extends Control
class_name Hud

const ItemIconPrefab = preload("res://UI/ItemIcon.tscn")

onready var health_statbar : StatBar = $StatsContainer/VBoxContainer/HealthStatBar
onready var armour_statbar : StatBar = $StatsContainer/VBoxContainer/ArmourStatBar
onready var items_container : Container = $InventoryConainer/VBoxContainer/HBoxContainer


func _ready() -> void:
	GameState.connect("item_collected", self, "_on_item_collected")
	GameState.connect("health_changed",health_statbar,"set_value")
	GameState.connect("armour_changed",armour_statbar,"set_value")	
	
	health_statbar.set_value(GameState.health, GameState.max_health)
	armour_statbar.set_value(GameState.armour, GameState.max_armour)
	

func _on_item_collected(item:Item)->void:
	print("item collected")
	var icon:ItemIcon = ItemIconPrefab.instance()
	items_container.add_child(icon)
	icon.item_data = item
	
