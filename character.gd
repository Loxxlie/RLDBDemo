extends Node2D

@export var grid_position: Vector2

func _input(event):
	if event.is_action_pressed("Up") && grid_position.y > 1:
		grid_position.y -= 1
	if event.is_action_pressed("Down") && grid_position.y < get_parent().grid_size.y:
		grid_position.y += 1
	if event.is_action_pressed("Left") && grid_position.x > 1:
		grid_position.x -= 1
	if event.is_action_pressed("Right") && grid_position.x < get_parent().grid_size.x:
		grid_position.x += 1
