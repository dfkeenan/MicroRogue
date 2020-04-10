extends Node

const MAX_STAT_MIN := 2

signal item_collected(item)
signal health_changed(health, max_health)
signal armour_changed(armour, max_armour)

var health:int = 2 setget set_health
var max_health:int = 2 setget set_max_health
var armour:int = 2 setget set_armour
var max_armour:int = 2 setget set_max_armour

var items = []

func collect_item(item:ItemData)-> void:
	if item.collect:
		items.append(item)
		emit_signal("item_collected", item)
	elif item.data and !item.data.empty():
		for data in item.data:
			match data:
				"health":
					self.health += item.data[data]
				"max_health":
					self.max_health += item.data[data]
				"armour":
					self.armour += item.data[data]
				"max_armour":
					self.max_armour += item.data[data]


func has_item(item_type:String)-> bool:
	for item in items:
		if item.type == item_type:
			return true
			
	return false

func damage_player(damage: int) -> void:
	var remainder = max(damage - armour,0)
	self.armour -= damage
	self.health -= remainder

func set_health(value:int)->void:
	health = clamp(max(value,0),0,max_health)
	emit_signal("health_changed", health, max_health)
	
func set_max_health(value:int)->void:
	max_health = value if value >= MAX_STAT_MIN else MAX_STAT_MIN
	health = max_health
	emit_signal("health_changed", health, max_health)
	
func set_armour(value:int)->void:
	armour = clamp(max(value,0),0,max_armour)
	emit_signal("armour_changed", armour, max_armour)
	
func set_max_armour(value:int)->void:
	max_armour = value if value >= MAX_STAT_MIN else MAX_STAT_MIN
	armour = max_armour
	emit_signal("armour_changed", armour, max_armour)	
