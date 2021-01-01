extends Control

var card_scene = preload('res://Scenes/Card.tscn')


func add_card(data: CardData):
	var new_card = card_scene.instance()
	new_card.card_data = data
	$HBoxContainer.add_child(new_card)
	#new_card.set_card_data(data)


func take_card() -> Control:
	var card = $HBoxContainer.get_children()[0]
	$HBoxContainer.remove_child(card)
	return card
