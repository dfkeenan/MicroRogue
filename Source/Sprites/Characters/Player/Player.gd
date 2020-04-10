extends KinematicBody2D
class_name Player

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

export var facing : Vector2 setget set_facing
var direction : Vector2 = Vector2.ZERO
var velocity: Vector2 = Vector2.ZERO

onready var state_machine : AnimationNodeStateMachine = get_node("AnimationTree").get("parameters/playback")
onready var animation_tree := $AnimationTree

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.facing = facing

func _unhandled_input(event: InputEvent) -> void:
	var input_direction : Vector2 = direction
	
	if event.is_action_pressed("player_move_right") or event.is_action_released("player_move_left"):
		input_direction.x += 1		
	elif event.is_action_pressed("player_move_left") or event.is_action_released("player_move_right"):
		input_direction.x	-= 1
	
	if event.is_action_pressed("player_move_down") or event.is_action_released("player_move_up"):
		input_direction.y += 1		
	elif event.is_action_pressed("player_move_up") or event.is_action_released("player_move_down"):
		input_direction.y	-= 1
	
	if direction != input_direction:
		var input_length := input_direction.length_squared()
		
		if input_length > 0:
			self.facing = input_direction
		
		if direction.length_squared() != input_length:
			state_machine.travel("Idle" if input_length == 0 else "Run")
			
		direction = input_direction
		

func _process(delta: float) -> void:
	
	velocity = move_and_slide(direction.normalized() * 32)
	pass
	
func set_facing(value:Vector2) -> void:
	facing = value
	if animation_tree:
		animation_tree.set("parameters/Idle/blend_position", value)
		animation_tree.set("parameters/Run/blend_position", value)
