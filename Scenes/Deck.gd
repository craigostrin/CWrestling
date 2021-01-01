extends Control

export(Array, Resource) var card_base
var deck = []

func _ready():
	randomize()
	setup_deck()


func remove_top_card() -> CardData:
	var card = deck[0]
	deck.erase(card)
	print('Current deck: ' + str(deck))
	return card


func setup_deck():
	for card in card_base:
		if card.has_method('get_deck_count'):
			var deck_count = card.get_deck_count()
			
			# Might want a unique ID for each card
			for i in deck_count:
				deck.append(card)
				print(card.get_name() + ': ' + str(i))
	
	deck.shuffle()
	print('Initial deck: ' + str(deck))
