extends Control

var card_scene = preload('res://Scenes/Card.tscn')


func add_card(data: CardData):
	var new_card = card_scene.instance()
	$HBoxContainer.add_child(new_card)
	new_card.set_card_data(data)
