extends Node2D

const CARD = preload("res://card.tscn")

func _ready():
	# The hand positions itself at the bottom middle of it's viewport.
	#position.x = get_window().size.x/2
	#position.y = get_window().size.y
	add_a_card()

func add_a_card():
	var card = CARD.instantiate()
	print(card.position)
	# card.position = Vector2.ZERO
	add_child(card)

func _draw():
	pass
	#draw_circle(Vector2.ZERO, 10, Color.BLUE)

func _process(delta):
	#position.y -= 100 * delta
	pass
	# for card in get_children():
	#	var hand_ratio = 0.5
	#	if get_child_count() > 1:
	#		hand_ratio = float(card.get_index())/float(get_child_count()-1)

