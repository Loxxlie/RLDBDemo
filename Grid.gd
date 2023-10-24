extends Node2D

@export var cell_dimensions: Vector2 = Vector2(100, 100)
@export var grid_size: Vector2 = Vector2(3, 3)
@export var color: Color = Color(255, 255, 255)
@export var border_width: float = 3
@export var neighbor_buffer: float = 10

func cell_pos(cell: Vector2) -> Vector2:
	return (cell * cell_dimensions) - (cell_dimensions/2)

func _process(_delta):
	for child in get_children():
		if child.is_in_group("GridNode"):
			# All child GridNodes will not inherit the grid's scale/skew transform.
			var new_transform = get_global_transform()
			new_transform.x = Vector2(1, 0)
			new_transform.y = Vector2(0, 1)
			child.set_global_transform(new_transform)
			
			# The child's position depends on their grid_position.
			child.position = cell_pos(child.grid_position)

func _draw():
	# Draw a box that contains the whole grid.
	var farCorner = cell_dimensions*grid_size
	draw_line(
		Vector2.ZERO,
		Vector2(farCorner.x, 0),
		color,
		border_width
	)
	draw_line(
		Vector2(farCorner.x, 0),
		farCorner,
		color,
		border_width
	)
	draw_line(
		farCorner,
		Vector2(0, farCorner.y),
		color,
		border_width
	)
	draw_line(
		Vector2(0, farCorner.y),
		Vector2.ZERO,
		color,
		border_width
	)
	
	# Draw the vertical lines in the grid.
	for x in range(0, grid_size.x, 1):
		var lineX = x * cell_dimensions.x
		draw_line(
			Vector2(lineX, 0),
			Vector2(lineX, farCorner.y),
			color,
			border_width,
		)
	
	# Draw the horizontal lines in the grid.
	for y in range(0, grid_size.y, 1):
		var lineY = (y * cell_dimensions.y)
		draw_line(
			Vector2(0, lineY),
			Vector2(farCorner.x, lineY),
			color,
			border_width,
		)

