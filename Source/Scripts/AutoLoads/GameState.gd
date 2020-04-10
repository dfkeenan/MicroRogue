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

func collect_item(item:Item)-> void:
	if item.collect:
		items.append(item)
		emit_signal("item_collected", item)
	elif item.stats and !item.stats.empty():
		for stat in item.stats:
			match stat:
				"health":
					self.health += item.stats[stat]
				"max_health":
					self.max_health += item.stats[stat]
		pass
		
		
		
func has_item(item_type:String)-> bool:
	for item in items:
		if item.type == item_type:
			return true
			
	return false

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
